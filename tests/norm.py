# A dumpbin /disasm /relocations /symbols listing as three normalised streams, one per call:
#   norm.py file.all dis   bytes of each instruction, then two spaces and its text
#   norm.py file.all rel   "<section name> <offset> <type> <symbol>" per relocation
#   norm.py file.all sym   "<value> <section name or UNDEF> <type> <class> <name>" per symbol
# Sections go by name, not number, so two objects that open them in a different order still
# compare; @comp.id, @feat.00 and .debug$S are ml64's own and left out.
import sys, re
src = open(sys.argv[1], encoding='latin-1').read().replace('\r', '').split('\n')
mode = sys.argv[2]
secname = {}
for l in src:
    m = re.match(r'^[0-9A-F]{3} 00000000 SECT([0-9A-F]+)\s+notype\s+Static\s+\| (\S+)$', l)
    if m: secname[m.group(1)] = m.group(2)
def sec(n):
    return secname.get(n, 'SECT' + n)
if mode == 'dis':
    cur = None
    out = []
    for l in src:
        m = re.match(r'^  ([0-9A-F]{16}): ((?:[0-9A-F]{2} )+)\s*(.*)$', l)
        if m:
            if cur: out.append(cur)
            cur = [m.group(2).strip(), m.group(3).strip()]
            continue
        m = re.match(r'^\s{20}([0-9A-F]{2}(?: [0-9A-F]{2})*)\s*$', l)
        if m and cur:
            cur[0] += ' ' + m.group(1).strip()
            continue
        if cur: out.append(cur); cur = None
    if cur: out.append(cur)
    for b, t in out: print(b + '  ' + t)
elif mode == 'rel':
    s = None
    for l in src:
        m = re.match(r'^RELOCATIONS #([0-9A-F]+)', l)
        if m: s = m.group(1); continue
        m = re.match(r'^ ([0-9A-F]{8})  (\S+)\s+(?:[0-9A-F]{8} )*\s*([0-9A-F]+)  (\S+)\s*$', l)
        if m and s: print(sec(s), m.group(1), m.group(2), m.group(4))
elif mode == 'sym':
    for l in src:
        m = re.match(r'^[0-9A-F]{3} ([0-9A-F]{8}) (\S+)\s+(notype(?: \(\))?)\s+(\S+)\s+\| (\S+)', l)
        if not m: continue
        name = m.group(5)
        if name in ('@comp.id', '@feat.00', '.debug$S'): continue
        where = m.group(2)
        if where.startswith('SECT'): where = sec(where[4:])
        if where == '.debug$S': continue
        print(m.group(1), where, m.group(3), m.group(4), name)
