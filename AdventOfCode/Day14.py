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

	return reduce(lambda x,y: x + y, map(lambda x: hex(x)[2:], todensehash(nums)))

#/DAY 10

import binascii

def to_binary_string(t):
	thelen = len(t)*4
	binval = bin(int(t, 16))[2:]
	while ((len(binval)) < thelen):
		binval = '0' + binval
	return binval

def del_nbh(tmp, x, y):
	found = False
	if tmp[x][y] == '1':
		found = True 
		tmp[x][y] = '0'
		
		if y > 0:
			del_nbh(tmp, 
		if y < 127:
		if x > 0:
		if x < 127:
		

inp = "nbysizxe"
tmp = []
for i  in range(0,128):
	t = "{0}-{1}".format(inp, i)
	tmp.append(to_binary_string(knot_hash(t)))

s = 0

for y in range(0,128):
	for x in range(0,128):		
		if not '1' in tmp:
			break
	
		tmp, found = del_nbh(x,y) 
		if found:
			s +=1 


print tmp























	
	
