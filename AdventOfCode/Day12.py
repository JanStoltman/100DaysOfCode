f    = open("Day12DB")
conn = {}
ucon = set([])

for line in f.readlines():
	ID = line.split('<->')[0].strip()
	co = map(lambda x: x.rstrip().strip(), line.split('<->')[1].split(', '))
	conn[ID] = conn.get(ID, []) + co

groups = 0
while len(conn) > 0:
	groups += 1
	tmp = conn[conn.keys()[0]]
	ucon.add(conn.keys()[0])
	while len(tmp) > 0:
		tmp += [i for i in conn[tmp[0]] if i not in ucon]
		ucon.add(tmp[0])
		del tmp[0]

	for key in ucon:
		conn.pop(key,None)
	ucon.clear()


print groups
