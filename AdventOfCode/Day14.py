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
	scale = 16 ## equals to hexadecimal
	num_of_bits = len(t) * log2(scale)
	bin(int(t, scale))[2:].zfill(num_of_bits)

inp = "nbysizxe"

for i  in range(0,128):
	t = "{0}-{1}".format(inp, i)
	print to_binary_string(knot_hash(t))


























	
	
