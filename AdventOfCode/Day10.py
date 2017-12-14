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


inp          = "227,169,3,166,246,201,0,47,1,255,2,254,96,3,97,144"
instructions = convinput(inp)
print instructions
nums         = range(0,256)
position     = 0
skip_size    = 0

for i in range(0,64):
	for instruciton in instructions:
		nums       = rotate(nums, instruciton, position)
		position  += instruciton + skip_size
		position  %= len(list(nums))
		skip_size += 1

print reduce(lambda x,y: x + y, map(lambda x: hex(x)[2:], todensehash(nums)))
