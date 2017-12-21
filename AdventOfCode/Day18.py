f     = open("Day18DB")
regs  = {}
pla   = 0
lines = f.readlines()
i     = 0

while i < len(lines):
	t = map(lambda x: x.rstrip().strip(), lines[i].split(' '))

	if   t[0] == "snd":
		pla = regs.get(t[1], 0)

	elif t[0] == "set": 
		if t[2].isalpha():
			regs[t[1]] = regs.get(t[2], 0)
		else:
			regs[t[1]] = int(t[2])

	elif t[0] == "add": 
		if t[2].isalpha():
			regs[t[1]] = regs.get(t[1], 0) + regs.get(t[2], 0)
		else:
			regs[t[1]] = regs.get(t[1], 0) + int(t[2])

	elif t[0] == "mul": 
		if t[2].isalpha():
			regs[t[1]] = regs.get(t[1], 0) * regs.get(t[2], 0)
		else:
			regs[t[1]] = regs.get(t[1], 0) * int(t[2])

	elif t[0] == "mod": 
		if t[2].isalpha():
			regs[t[1]] = regs.get(t[1], 0) % regs.get(t[2], 0)
		else:
			regs[t[1]] = regs.get(t[1], 0) % int(t[2])

	elif t[0] == "rcv": 
		if t[1].isalpha():
			if regs.get(t[1], 0) != 0:
				print pla
				break
		elif int(t[1]) != 0:
			print pla
			break
			
	elif t[0] == "jgz": 
		if t[2].isalpha():
			i += regs.get(t[2], 0) - 1 if regs.get(t[1], 0) > 0 else 0
		else:
			i += int(t[2]) - 1 if regs.get(t[1], 0) > 0 else 0
		

	i += 1		
