from collections import namedtuple

Instruction = namedtuple("Instruction", "name inc command cond")

def readInstructions():
	db  = open("Day8DB")
	tmp = [] 
	for line in db.readlines():
		vals    = line.split(' ')
		name    = vals[0]
		command = vals[1]
		inc     = vals[2]
		cond    = line.split('if')[1].rstrip().strip()
		tmp.append(Instruction(name, inc, command, cond))
	
	return tmp


def eval_cond(val, cond):
	cval = int(cond.split(' ')[2])
	ins  = cond.split(' ')[1]
	if ins == '>':
		return val > cval
	elif ins == '<':
		return val < cval
	elif ins == '==':
		return val == cval
	elif ins == '>=':
		return val >= cval
	elif ins == '<=':
		return val <= cval
	elif ins == '!=':
		return val != cval


instructions = readInstructions()
registers = {}
m = 0
for ins in instructions:
	registers[ins.name] = registers.get(ins.name, 0) 
	if eval_cond(registers.get(ins.cond.split(' ')[0], 0) ,ins.cond):
		registers[ins.name] += int(ins.inc) if ins.command == 'inc' else -1*int(ins.inc)
		m = max(m,registers[ins.name])

print m
print max(registers.values())
print registers

