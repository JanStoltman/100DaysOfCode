f = open("Day13DB")
records = {}
for line in f.readlines():
	l = line.split(':')
	records[int(l[0])] = int(l[1].rstrip().strip())

print records

severity = 1
delay    = 1178128

while severity > 0:
	pisec    = 0
	severity = 0
	delay   += 1
	while pisec <= max(records.keys()):
		if pisec in records.keys() and (pisec + delay) % (records[pisec] + (records[pisec] - 2)) == 0:
			severity = 1
			break
		pisec += 1

print '\n'
print severity
print delay
