#DAY 10
from collections import deque
def rotate(nums, inst, position):
	tmp  = []
	ind  = []
	bckc = 0
	stp  = position

	while position < len(nums) and inst > 0:
		tmp.append(nums[position])
		ind.append(position)
		inst     -= 1
		position += 1
		if position == len(nums):
			position = 0

	tmp  = list(reversed(tmp))
	for i,j in zip(ind,range(0,len(tmp))):
		nums[i] = tmp[j]
	
	return nums
	

def convinput(imp):
	return map(lambda x: ord(x), imp) +  [17, 31, 73, 47, 23]

def chunks(l, n):
    for i in range(0, len(l), n):
        yield l[i:i + n]

def todensehash(nums):
	tmp   = []
	for part in chunks(nums,16):
		tmp.append(reduce(lambda x,y: x ^ y, part))

	return tmp


def knot_hash(inp):
	instructions = convinput(inp)
	nums         = range(0,256)
	position     = 0
	skip_size    = 0

	for i in range(0,64):
		for instruciton in instructions:
			nums       = rotate(nums, instruciton, position)
			position  += instruciton + skip_size
			position  %= len(list(nums))
			skip_size += 1

	z = reduce(lambda x,y: x + y, map(lambda x: hex(x)[2:].zfill(2), todensehash(nums)))
	return z

#</DAY 10>

import binascii
inp = "nbysizxe"
tmp = []

def to_binary_string(t):
	thelen = len(t)*4
	binval = bin(int(t, 16))[2:]
	while ((len(binval)) < thelen):
		binval = '0' + binval
	return binval

def del_nbh(x, y):
	found = False
	if tmp[x][y] == '1':
		found = True 
		tmp[x][y] = '0'
		
		if y > 0:
			del_nbh(x,y - 1)
		if y < len(tmp) - 1:
			del_nbh(x,y + 1)
		if x > 0:
			del_nbh(x - 1,y)
		if x < len(tmp[y]) - 1:
			del_nbh(x + 1,y)

	return found
		

for i  in range(0,128):
	t = "{0}-{1}".format(inp, i)
	tmp.append(list(to_binary_string(knot_hash(t))))

s = 0
print len(tmp)
print len(tmp[0])

for y in range(0,len(tmp)):
	for x in range(0,len(tmp[0])):	
		if del_nbh(x,y):
			s +=1 

print s























	
	
