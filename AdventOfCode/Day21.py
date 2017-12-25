from array import array
from itertools import chain
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

def mtr_size(mtr):
	if len(mtr) != len(mtr[0]):
		raise Exception("len(mtr) != len(mtr[0])")
	
	return len(mtr[0]) 

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

#Do main loop
for _ in range(0,18):
	size = 2 + len(mtr) % 2
	t = []
	
	for i in range(0,len(mtr),size):
		tt = []
		z  = []
		for j in range(0,len(mtr),size):
			ttt = []
			for ii in range(i, i + size):
				for jj in range(j, j + size):
					ttt.append(mtr[ii][jj])
				tt.append(ttt)
				ttt = []
			z.append(tt)
			tt = []
		t.append(z)
		z = []

	t = map(lambda x: map(lambda xx: ins[str(xx)],x),t)

	mtr = []
	tl = []
	for l in t:
		tl.append([list(chain.from_iterable(x)) for x in zip(*l)])

	for l in tl:
		for ll in l:
			mtr.append(ll)

print mtr

print sum([row.count('#') for row in mtr])
#Screw this list manipulations 



		
	










