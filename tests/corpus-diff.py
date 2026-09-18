# The corpus against ml64, three streams per file: the code bytes of every instruction, the
# relocations, the symbols - both objects listed by dumpbin on the box (tests/windows/corpus.cmd)
# and normalised by tests/norm.py. usage: corpus-diff.py <dir of my .all> <dir of ml64 .all>
import sys, os, glob, subprocess, collections
here = os.path.dirname(os.path.abspath(__file__))
mine, ml = sys.argv[1], sys.argv[2]
def streams(path):
    r = []
    for mode in ('dis', 'rel', 'sym'):
        out = subprocess.run(['python3', here + '/norm.py', path, mode], capture_output=True, text=True).stdout
        r.append([l for l in out.split('\n') if l])
    r[0] = [l.split('  ')[0] for l in r[0]]
    return r
tot = collections.Counter()
first = collections.Counter()
names = sorted(os.path.basename(f)[:-4] for f in glob.glob(mine + '/*.all'))
for n in names:
    other = ml + '/' + n + '.all'
    if not os.path.exists(other): continue
    a = streams(mine + '/' + n + '.all'); b = streams(other)
    tot['files'] += 1
    tot['instructions'] += len(b[0])
    same = 0
    if a[0] == b[0]: tot['bytes'] += 1
    else:
        d = [(x, y) for x, y in zip(a[0], b[0]) if x != y]
        tot['instructions-differ'] += len(d) + abs(len(a[0]) - len(b[0]))
        if d: first['bytes  ml64 %s  mine %s' % (d[0][1], d[0][0])] += 1
        else: first['bytes  %d instructions here, %d in ml64' % (len(a[0]), len(b[0]))] += 1
    if a[1] == b[1]: tot['relocs'] += 1
    else:
        x = sorted(set(b[1]) ^ set(a[1]))
        first['reloc  ' + (x[0] if x else 'same set, different order')] += 1
    if sorted(a[2]) == sorted(b[2]): tot['symbols'] += 1
    else:
        x = sorted(set(b[2]) - set(a[2])); y = sorted(set(a[2]) - set(b[2]))
        first['symbol ' + ('ml64 only: ' + x[0] if x else 'mine only: ' + y[0])] += 1
print('%d files, %d instructions: bytes identical %d, relocations identical %d, symbols identical %d' % (
    tot['files'], tot['instructions'], tot['bytes'], tot['relocs'], tot['symbols']))
for k, c in first.most_common(12): print('%5d  %s' % (c, k))
sys.exit(0 if tot['bytes'] == tot['files'] and tot['relocs'] == tot['files'] and tot['symbols'] == tot['files'] else 1)
