from collections import deque 

f     = open("Day18DB")
lines = f.readlines()
f.close()

regs  = {}
pla   = 0
i     = 0
j     = 0
su    = 0

cid   = 'a'
A_q   = deque([])
B_q   = deque([])
Aw    = False
Bw    = False

def repC(x):
	dn = True
	mv = 0
	t = map(lambda x: x.rstrip().strip(), lines[x].split(' '))

	if   t[0] == "snd":
		if cid == 'a':
			B_q.append(regs.get(t[1] + cid, 0))
		else:
			global su
			su += 1
			A_q.append(regs.get(t[1] + cid, 0))

	elif t[0] == "set": 
		if t[2].isalpha():
			regs[t[1] + cid] = regs.get(t[2] + cid, 0)
		else:
			regs[t[1] + cid] = int(t[2])

	elif t[0] == "add": 
		if t[2].isalpha():
			regs[t[1] + cid] = regs.get(t[1] + cid, 0) + regs.get(t[2] + cid, 0)
		else:
			regs[t[1] + cid] = regs.get(t[1] + cid, 0) + int(t[2])

	elif t[0] == "mul": 
		if t[2].isalpha():
			regs[t[1] + cid] = regs.get(t[1] + cid, 0) * regs.get(t[2] + cid, 0)
		else:
			regs[t[1] + cid] = regs.get(t[1] + cid, 0) * int(t[2])

	elif t[0] == "mod": 
		if t[2].isalpha():
			regs[t[1] + cid] = regs.get(t[1] + cid, 0) % regs.get(t[2] + cid, 0)
		else:
			regs[t[1] + cid] = regs.get(t[1] + cid, 0) % int(t[2])

	elif t[0] == "rcv": 
		if cid == 'a' and len(A_q) > 0:
			v = A_q.popleft()
			regs[t[1] + cid] = v
		elif cid == 'b' and len(B_q) > 0:
			v = B_q.popleft()
			regs[t[1] + cid] = v
		else:
			dn = False
		
	elif t[0] == "jgz": 
		if t[2].isalpha():
			mv = regs.get(t[2] + cid, 0) - 1 if regs.get(t[1] + cid, 0) > 0 else 0
		else:
			mv = int(t[2]) - 1 if regs.get(t[1] + cid, 0) > 0 else 0

	return dn, mv



while i < len(lines) and j < len(lines):
	print "i:{0} j:{1} su:{2}".format(i,j,su)

	if cid == 'a':
		dn, mv = repC(i) 
		Aw     = not dn
		if dn and i < len(lines) - 1:
			i += 1 + mv
		cid = 'b'
	else:
		dn, mv = repC(j) 
		Bw     = not dn
		if dn and j < len(lines) - 1:
			j += 1 + mv
		cid = 'a'

	if Aw and Bw:
		break
			
print su






















