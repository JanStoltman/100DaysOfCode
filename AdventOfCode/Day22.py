def get_data():
	f = open("Day22DB")
	db = []
	for line in f.readlines():
		db.append(list(line.strip()))
	return db

def get_start_pt(db):
	ys = (len(db) - 1) / 2
	xs = (len(db[0]) - 1) / 2
	return ys, xs

def turn_left(b):
	return 4 if b == 1 else (b - 1)

def turn_right(b):
	return 1 if b == 4 else (b + 1)

def move(y, x, b):
	if   b == 1:
		y -= 1
	elif b == 2:
		x += 1
	elif b == 3:
		y += 1
	elif b == 4:
		x -= 1

	return y, x 

db     = get_data()
b      = 1 #bearing 1-U 2-R 3-D 4-L
y, x = get_start_pt(db)
inf    = 0#How many infected cells

for _ in range(0,10000000):
	if y < 0:
		db.insert(0,(['.'] * len(db[0])))
		y += 1
	elif y >= len(db):
		db.append(['.'] * len(db[0]))
	elif x < 0:
		db = [['.'] + r for r in db]
		x += 1
	elif x >= len(db[0]):
		db = [r + ['.'] for r in db]

	c = db[y][x]

	if   c == '.':
		b = turn_left(b)
		db[y][x] = 'w'	
	elif c == '#':
		b = turn_right(b)	
		db[y][x] = 'f'
	elif c == 'w':
		db[y][x] = '#'	
		inf += 1
	elif c == 'f':
		b = turn_left(b)
		b = turn_left(b)
		db[y][x] = '.'	
	
	y, x = move(y, x, b)

print inf



















