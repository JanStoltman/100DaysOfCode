import re
import sys

def extract(l):
	r = [int(x) for x in re.findall(r"[-]*\d+", l)]
	return [r[0:3],r[3:6],r[6:9]]#[[p],[v],[a]]

def man_dist(p):
	return sum(abs(x) for x in p[0])

f = open("Day20DB")
db = [extract(l.strip()) for l in f.readlines()]
f.close()

for i in range(0,500):
	for p in db:
		p[1] = [sum(x) for x in zip(p[1], p[2])]
		p[0] = [sum(x) for x in zip(p[0], p[1])]

res = map(lambda x: man_dist(x), db)
v   = res.index(min(res))
print(v)


#Part 2
f = open("Day20DB")
db = [extract(l.strip()) for l in f.readlines()]
f.close()

for _ in range(0,500):
	for p in db:
		p[1] = [sum(x) for x in zip(p[1], p[2])]
		p[0] = [sum(x) for x in zip(p[0], p[1])]

	i = 0
	while i < len(db) - 1:
		j = i + 1
		f = False

		while j < len(db):
			if db[i][0] == db[j][0]:
				del db[j]
				f = True
			else:
				j += 1

		if f:
			del db[i]
		else:
			i += 1

print(len(db))
