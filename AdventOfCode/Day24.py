from Tree import Tree
f  = open("Day24DB")
cm = [] 

for l in f.readlines():
	t = l.split('/')
	cm.append((int(t[0]), int(t[1]), 0))


cm = sorted(cm, key=sum, reverse=True)

