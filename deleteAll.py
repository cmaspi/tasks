import os
import sys

f = open(os.path.join(sys.path[0], "Tdo.csv"),'w+')
f.close()
f = open(os.path.join(sys.path[0], "Tdone.csv"),'w+')
f.close()
