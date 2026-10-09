# The code bytes of a COFF object, one hex line per section: what tests/enc.sh compares with ml64's
# listing, so the check needs no disassembler. python3 is on all three machines; nothing else is.
# With --comdat first, one line instead: `comdat N`, the sections carrying IMAGE_SCN_LNK_COMDAT.
import struct, sys
args = sys.argv[1:]
comdat = args[0] == '--comdat'
d = open(args[-1], 'rb').read()
nsec = struct.unpack_from('<H', d, 2)[0]
marked = 0
for i in range(nsec):
    h = 20 + 40 * i
    name = d[h:h + 8].rstrip(b'\0').decode('latin-1')
    size, raw = struct.unpack_from('<II', d, h + 16)
    flags = struct.unpack_from('<I', d, h + 36)[0]
    if flags & 0x1000:
        marked += 1
    if not comdat and flags & 0x20 and size:
        print(' '.join('%02X' % b for b in d[raw:raw + size]))
if comdat:
    print('comdat %d' % marked)
