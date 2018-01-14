from Turing import Machine

m = Machine()

for i in range(0,12629077):
	if   m.st == 'A':
		if   m.cval() == 0:
			m.write(1)
			m.move(1)
			m.swap('B')
		elif m.cval() == 1:
			m.write(0)
			m.move(-1)
			m.swap('B')

	elif m.st == 'B':
		if   m.cval() == 0:
			m.move(1)
			m.swap('C')
		elif m.cval() == 1:
			m.move(-1)

	elif m.st == 'C':
		if   m.cval() == 0:
			m.write(1)
			m.move(1)
			m.swap('D')
		elif m.cval() == 1:
			m.write(0)
			m.move(-1)
			m.swap('A')

	elif m.st == 'D':
		if   m.cval() == 0:
			m.write(1)
			m.move(-1)
			m.swap('E')
		elif m.cval() == 1:
			m.move(-1)
			m.swap('F')

	elif m.st == 'E':
		if   m.cval() == 0:
			m.write(1)
			m.move(-1)
			m.swap('A')
		elif m.cval() == 1:
			m.write(0)
			m.move(-1)
			m.swap('D')

	elif m.st == 'F':
		if   m.cval() == 0:
			m.write(1)
			m.move(1)
			m.swap('A')
		elif m.cval() == 1:
			m.move(-1)
			m.swap('E')

m.checksum()
