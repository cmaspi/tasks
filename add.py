import sys
f = open("Tdo.csv",'r+')
lines = [list(line.rstrip().split(',')) for line in f]
count = len(lines)

f.write('{}, {}\n'.format(count," ".join(sys.argv[1:])))
f.close()