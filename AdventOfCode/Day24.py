from Tree import TreeNode
f  = open("Day24DB")
cm = [] 

for l in f.readlines():
	t = l.split('/')
	cm.append((int(t[0]), int(t[1]), 0))


cm   = sorted(cm, key=sum, reverse=True)
begs = filter(lambda x:     x[0] == 0 or x[1] == 0 , cm) 
cm   = filter(lambda x: not(x[0] == 0 or x[1] == 0), cm) 

