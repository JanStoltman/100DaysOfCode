from collections import deque

tmp   = deque([0])
ti     = 0
steps = 335

for i in range(1,50000001):
	tmp.rotate(-steps)
	tmp.append(i)

print (tmp[tmp.index(2017) + 1])
print (tmp[tmp.index(0) + 1])
