import sys
index = sys.argv[1]
f = open("Tdo.csv",'r')
lines = [list(line.rstrip().split(',')) for line in f]
f.close()
# try:
lines.pop(int(index))
# except:
    # pass
f=open("Tdo.csv",'w+')
for i in range(len(lines)):
    f.write('{}, {}\n'.format(i,lines[i][1].lstrip()))
        
f.close()