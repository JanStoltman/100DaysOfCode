tab1 = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p']
tab  = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p']


for i in range(0,10):#tab1 occurs every 30 cycles
	if tab == tab1:
		print tab
		print i
	f  = open("Day16DB")
	while True:
		t = f.read(1) 
		if   t == 's':
			X = f.read(1)
			x = f.read(1)
			if x != ',':
				Rx = int(X + x)
			else:
				Rx = int(X)
	
			tab = tab[-Rx:] + tab[0:-Rx]
	
		elif t == 'x':
			A = f.read(1)
			a = f.read(1)
			if a != '/':
				Ra = int(A+a)
				f.seek(1,1)
			else:
				Ra = int(A)
	
			B = f.read(1)
			b = f.read(1)
			if b != ',':
				Rb = int(B+b)
			else:
				Rb = int(B)

			tm = tab[Ra]
			tab[Ra] = tab[Rb]
			tab[Rb] = tm

		elif t == 'p':
 			A = f.read(1)
			f.seek(1,1)
			B = f.read(1)

			i1 = tab.index(A)
			i2 = tab.index(B)

			tm = tab[i1]
			tab[i1] = tab[i2]
			tab[i2] = tm

		elif t == ',':
			continue

		else:
			break
			#raise ValueError('unexpected token in DB: {0}'.format(t))
	f.close()

print tab
