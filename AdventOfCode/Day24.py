from Tree import Tree
f  = open("Day24DB")
cm = [] 

for l in f.readlines():
	t = l.split('/')
	cm.append((int(t[0]), int(t[1]), 0))


cm = sorted(cm, key=sum, reverse=True)

trees = []

i = 0
while i < len(cm):
	if cm[i][1] == 0 or cm[i][0] == 0:
		t = Tree()
		t.data = ((cm[i][0],cm[i][1], 1))		
		trees.append(t)
		del(cm[i])
	else:
		i += 1


