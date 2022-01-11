import sys
index = sys.argv[1]
f = open("Tdo.csv",'r')
lines = [list(line.rstrip().split(',')) for line in f]
f.close()
try:
    doneLine = lines[int(index)]
    print(doneLine)
    f = open("Tdone.csv",'a')
    f.write('{}\n'.format(doneLine[1].lstrip()))
    f.close()

except:
    pass