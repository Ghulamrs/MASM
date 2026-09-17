#include "asm.h"
#include <cctype>

std::string upper(const std::string &s)
{
    std::string r = s;
    for (size_t i = 0; i < r.size(); i++)
        r[i] = (char)toupper((unsigned char)r[i]);
    return r;
}

bool is_punct(const std::vector<Token> &t, size_t i, char c)
{
    return i < t.size() && t[i].kind == T_PUNCT && t[i].text[0] == c;
}

static bool name_char(char c, bool first)
{
    if (isalpha((unsigned char)c) || c == '_' || c == '$' || c == '@' || c == '?')
        return true;
    if (first)
        return c == '.';
    return isdigit((unsigned char)c) != 0;
}

static bool number(const std::string &s, long long &v)
{
    int base = 10;
    std::string d = s;
    char last = (char)toupper((unsigned char)d[d.size() - 1]);
    if (last == 'H') { base = 16; d.erase(d.size() - 1); }
    else if (last == 'B' && d.size() > 1) { base = 2; d.erase(d.size() - 1); }
    if (d.empty())
        return false;
    unsigned long long r = 0;
    for (size_t i = 0; i < d.size(); i++) {
        int c = toupper((unsigned char)d[i]);
        int k;
        if (c >= '0' && c <= '9') k = c - '0';
        else if (c >= 'A' && c <= 'F') k = c - 'A' + 10;
        else return false;
        if (k >= base)
            return false;
        r = r * base + k;
    }
    v = (long long)r;
    return true;
}

bool split_line(const std::string &src, std::vector<Token> &out, std::string &err)
{
    out.clear();
    size_t i = 0;
    size_t n = src.size();
    while (i < n) {
        char c = src[i];
        if (c == ';')
            break;
        if (isspace((unsigned char)c)) { i++; continue; }
        Token t;
        t.value = 0;
        t.wide = false;
        if (name_char(c, true)) {
            size_t s = i++;
            while (i < n && name_char(src[i], false)) i++;
            t.kind = T_NAME;
            t.text = src.substr(s, i - s);
        } else if (isdigit((unsigned char)c)) {
            size_t s = i++;
            while (i < n && isalnum((unsigned char)src[i])) i++;
            t.kind = T_NUM;
            t.text = src.substr(s, i - s);
            if (!number(t.text, t.value)) {
                err = "bad number '" + t.text + "'";
                return false;
            }
            t.wide = (unsigned long long)t.value >= 0x100000000ULL;
        } else if (c == '\'' || c == '"') {
            size_t s = ++i;
            while (i < n && src[i] != c) i++;
            if (i >= n) {
                err = "unterminated string";
                return false;
            }
            t.kind = T_STR;
            t.text = src.substr(s, i - s);
            i++;
        } else if (c == ',' || c == ':' || c == '[' || c == ']' || c == '(' || c == ')' ||
                   c == '+' || c == '-' || c == '*' || c == '/') {
            t.kind = T_PUNCT;
            t.text = std::string(1, c);
            i++;
        } else {
            err = std::string("unexpected character '") + c + "'";
            return false;
        }
        out.push_back(t);
    }
    return true;
}
