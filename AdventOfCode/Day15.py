A_factor = 16807
B_factor = 48271
A_state  = 116
B_state  = 299
divider  = 2147483647
points   = 0
#for _ in range(0,40000000):
#	A_state = A_state * A_factor % divider
#	B_state = B_state * B_factor % divider
#
#	if bin(A_state)[-16:] == bin(B_state)[-16:]:
#		points += 1
#	
#	#print "A:{0} B:{1}".format(A_state, B_state)

for _ in range(0,5000000):
	A_state = A_state * A_factor % divider
	B_state = B_state * B_factor % divider

	while A_state % 4 != 0:
		A_state = A_state * A_factor % divider
	while B_state % 8 != 0:
		B_state = B_state * B_factor % divider

	if bin(A_state)[-16:] == bin(B_state)[-16:]:
		points += 1
	
	#print "A:{0} B:{1}".format(A_state, B_state)


print points
