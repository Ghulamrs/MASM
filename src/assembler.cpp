#include "asm.h"
#include <fstream>

Assembler::Assembler(const std::string &in, const std::string &out, Target *t, ObjWriter *w)
    : input(in), output(out), target(t), writer(w)
{
}

Assembler::~Assembler()
{
    delete target;
    delete writer;
}

const std::vector<std::string> &Assembler::errors() const
{
    return unit.errors;
}

bool Assembler::run()
{
    std::ifstream f(input.c_str());
    if (!f) {
        unit.errors.push_back("cannot open " + input);
        return false;
    }
    std::string text;
    std::vector<Token> tokens;
    while (!target->finished() && std::getline(f, text)) {
        unit.line++;
        if (!text.empty() && text[text.size() - 1] == '\r')
            text.erase(text.size() - 1);
        std::string err;
        if (!split_line(text, tokens, err)) {
            unit.error(err);
            continue;
        }
        if (!tokens.empty())
            target->statement(unit, tokens);
    }
    if (!target->finished())
        unit.error("END expected");
    unit.resolve();
    if (!unit.errors.empty())
        return false;
    std::string err;
    if (!writer->write(unit, output, err)) {
        unit.errors.push_back(err);
        return false;
    }
    return true;
}
