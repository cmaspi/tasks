import sys
import os
f = open(os.path.join(sys.path[0], "../data/Tdo.csv"),'r+')
lines = [list(line.rstrip().split(',')) for line in f]
count = len(lines)

f.write('{}, {}\n'.format(count," ".join(sys.argv[1:])))
f.close()