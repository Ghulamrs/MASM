#include "asm.h"
#include "x64.h"
#include "mscoff.h"
#include <cstdio>
#include <cstring>
#include <thread>

static std::string object_name(const std::string &in)
{
    size_t dot = in.find_last_of('.');
    size_t slash = in.find_last_of("/\\");
    if (dot == std::string::npos || (slash != std::string::npos && dot < slash))
        return in + ".obj";
    return in.substr(0, dot) + ".obj";
}

#include <exception>
#include <new>

/* a job's failure is its own: memory that ran out or a stream that broke is recorded
   against the file, and the other jobs finish */
static void job(Assembler *a, bool *ok)
{
    try {
        *ok = a->run();
    } catch (const std::bad_alloc &) {
        a->fail("out of memory");
        *ok = false;
    } catch (const std::exception &e) {
        a->fail(std::string("internal error: ") + e.what());
        *ok = false;
    }
}

static int usage()
{
    fprintf(stderr, "usage: asm -t x64 file.asm... [-o out.obj]\n");
    return 2;
}

int main(int argc, char **argv)
{
    std::string target;
    std::string output;
    std::vector<std::string> inputs;
    for (int i = 1; i < argc; i++) {
        if (strcmp(argv[i], "-t") == 0 && i + 1 < argc) target = argv[++i];
        else if (strcmp(argv[i], "-o") == 0 && i + 1 < argc) output = argv[++i];
        else if (argv[i][0] == '-') return usage();
        else inputs.push_back(argv[i]);
    }
    if (inputs.empty() || (!output.empty() && inputs.size() > 1))
        return usage();
    if (target != "x64") {
        fprintf(stderr, "target '%s' is not available in this version\n", target.c_str());
        return 2;
    }

    size_t n = inputs.size();
    std::vector<std::string> outputs(n);
    for (size_t i = 0; i < n; i++) {
        outputs[i] = output.empty() ? object_name(inputs[i]) : output;
        /* two jobs writing one object would race; the second name is refused before either runs */
        for (size_t k = 0; k < i; k++)
            if (outputs[k] == outputs[i]) {
                fprintf(stderr, "%s and %s would both write %s\n", inputs[k].c_str(), inputs[i].c_str(), outputs[i].c_str());
                return 2;
            }
    }
    std::vector<Assembler *> jobs(n);
    for (size_t i = 0; i < n; i++)
        jobs[i] = new Assembler(inputs[i], outputs[i], new X64Target(), new CoffWriter());

    bool *ok = new bool[n];
    std::vector<std::thread> threads;
    for (size_t i = 0; i < n; i++) {
        try {
            threads.push_back(std::thread(job, jobs[i], &ok[i]));
        } catch (const std::exception &) {
            /* no thread to be had: this file is assembled on the main thread instead */
            job(jobs[i], &ok[i]);
        }
    }
    for (size_t i = 0; i < threads.size(); i++)
        threads[i].join();

    int failed = 0;
    for (size_t i = 0; i < n; i++) {
        const std::vector<std::string> &e = jobs[i]->errors();
        for (size_t k = 0; k < e.size(); k++)
            fprintf(stderr, "%s: %s\n", inputs[i].c_str(), e[k].c_str());
        if (!ok[i]) failed++;
        delete jobs[i];
    }
    delete[] ok;
    return failed ? 1 : 0;
}
