import sys
import os
index = sys.argv[1]
f = open(os.path.join(sys.path[0], "Tdo.csv"),'r')
lines = [list(line.rstrip().split(',')) for line in f]
f.close()
try:
    doneLine = lines[int(index)]
    f = open(os.path.join(sys.path[0], "Tdone.csv"),'a')
    f.write('{}\n'.format(doneLine[1].lstrip()))
    f.close()

except:
    pass