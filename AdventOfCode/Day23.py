from collections import deque 

f     = open("Day23DB")
lines = f.readlines()
f.close()

regs  = {}
i     = 0
s     = 0

while i >= 0 and i < len(lines):
	t = map(lambda x: x.strip(), lines[i].split(' '))

	if t[0] == "set": 
		if t[2].isalpha():
			regs[t[1]] = regs.get(t[2], 0)
		else:
			regs[t[1]] = int(t[2])
	elif t[0] == "sub": 
		if t[2].isalpha():
			regs[t[1]] = regs.get(t[1], 0) - regs.get(t[2],0)
		else:
			regs[t[1]] = regs.get(t[1], 0) - int(t[2])

	elif t[0] == "mul": 
		s += 1
		if t[2].isalpha():
			regs[t[1]] = regs.get(t[1], 0) * regs.get(t[2], 0)
		else:
			regs[t[1]] = regs.get(t[1], 0) * int(t[2])
	
	elif t[0] == "jnz": 
		if t[1].isalpha():
			if regs.get(t[1], 0) != 0:
				if t[2].isalpha():
					i += regs.get(t[2],0) - 1
				else:
					i += int(t[2]) - 1
		else:
			if int(t[1]) != 0:
				if t[2].isalpha():
					i += regs.get(t[2],0) - 1
				else:
					i += int(t[2]) - 1
	
	i += 1

print s
 
h = 0
for x in range(108100,125100 ,17):
    for i in range(2,x):
        if x % i == 0:
            h += 1
            break
print(h)























