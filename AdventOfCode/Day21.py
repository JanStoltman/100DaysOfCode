mtr = [ ['.','#','.'],
		['.','.','#'],
		['#','#','#'] ]

ins = {}

def rotate(m):
	return [list(x) for x in zip(*m[::-1])]
	
def flip(m):
	l = len(m[0]) - 1
	for i in range(0, len(m)):
			t = m[i][l]
			m[i][l] = m[i][0]
			m[i][0] = t
			
	return m

def divide2(mtr):
	return [mtr]

def divide3(mtr):
	return [mtr]

#Read instrucitons and create dictionares for matrices
f = open("Day21DB")
for line in f.readlines():
	t = line.strip().split(" => ")
	k = [list(x) for x in t[0].split('/')]
	v = [list(x) for x in t[1].split('/')]
	
	for i in range(0,4):
		ins[str(k)] = v
		k = rotate(k)

	k = flip(k)
	
	for i in range(0,4):
		ins[str(k)] = v
		k = rotate(k)

print len(ins)
print ins[str(mtr)]

for _ in range(0,5):
	if len(mtr) != len(mtr[0]):
		raise Exception("len(mtr) != len(mtr[0])")
	
	size = len(mtr[0]) 

	if   size > 2 and size % 2 == 0:
		t = divide2(mtr)
	elif size > 3 and size % 3 == 0:
		t = divide3(mtr)
	else:
		t = [mtr]

	










