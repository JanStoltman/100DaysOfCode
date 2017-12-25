from itertools import cycle
def get_data():
	f = open("Day22DB")
	db = []
	for line in f.readlines():
		db.append(list(line.strip()))
	return db

def get_start_pt(db):
	ys = len(db) - 1 / 2
	xs = len(db[0]) - 1 / 2
	return ys, xs

db     = get_data()
b      = cycle([1,2,3,4]) #bearing 1-U 2-R 3-D 4-L
i, j = get_start_pt(db)
inf    = 0#How many infected cells

for _ in range(0,1000):
	c = db[y][x]
	
	if   c == '.':
		b = next(b)	
	elif c == '#':
		
	
