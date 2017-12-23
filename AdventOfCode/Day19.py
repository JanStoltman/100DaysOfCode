f  = open("Day19DB")
db = [list(l) for l in f.readlines()]

y  = 0 #Starting y
x  = db[0].index('|') #starting x
tb = 3 #True bearing of packet 1-N 2-E 3-S 4-W

le = [] #Accumulated letters
st = 0  #steps
print "starting x:{0} y:{1}".format(x,y)

def move(x,y):
	if   tb == 1:
		y -= 1
	elif tb == 2:
		x += 1
	elif tb == 3:
		y += 1
	elif tb == 4:
		x -= 1	
	return x, y

#---- main loop
while True: #Determine new bearing after stepping on next character
	try:
		x, y = move(x, y)
		nc   = db[y][x]#next character to be stepped on
	except IndexError:#We will be out of labirynt 
		print "Index error x:{0} y:{1}".format(x,y)
		print le
		break

	if   nc == '|':
		if tb != 1 and tb != 3:
			print "Crossing: Tb !13 |"

	elif nc == '-':
		if tb != 2 and tb != 4:
			print "Crossing: Tb !24 -"

	elif nc == '+': #Intersection, change bearing 
		if tb == 1 or tb == 3:
			if x + 1 < len(db[0]) and db[y][x + 1] != '|' and db[y][x + 1] != ' ':
				tb = 2
			else:
				tb = 4			
		else:
			if y - 1 > 0 and db[y - 1][x] != '-' and db[y - 1][x] != ' ':
				tb = 1
			else:
				tb = 3	
					

	elif nc == ' ':
		print le
		print st + 1
		raise Exception("Space except")
	else:
		le.append(nc)

	st += 1
	
	
	
print le
print st
