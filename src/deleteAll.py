import os
import sys

f = open(os.path.join(sys.path[0], "../data/Tdo.csv"),'w+')
f.close()
f = open(os.path.join(sys.path[0], "../data/Tdone.csv"),'w+')
f.close()
