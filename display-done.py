import sys
import os
f = open(os.path.join(sys.path[0], "../data/Tdone.csv"),'r+')
for line in f:
    print(line)