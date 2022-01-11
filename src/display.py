import sys
import os
f = open(os.path.join(sys.path[0], "../data/Tdo.csv"),'r+')
for line in f:
    print(line)