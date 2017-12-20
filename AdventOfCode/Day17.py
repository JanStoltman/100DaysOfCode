tmp   = [0]
ti     = 0
steps = 3
for i in range(1,4):
	for j in range(0,steps):
		ti = (ti + 1)%len(tmp)
			
	tmp.insert(ti + 1,i)
	print tmp

print tmp[tmp.index(2017) + 1]
print max(tmp)
