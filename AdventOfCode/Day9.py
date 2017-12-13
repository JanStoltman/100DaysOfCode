import re

db  = open("Day9DB")
txt = db.read()
txt = re.sub('<((!.)|[^>])*>{1}','',txt)
txt = re.sub(',','',txt)
print txt
op = 0
su = 0
for char in txt:
	if   char =='{':
		op += 1
		su += op
	elif char == '}':
		op -= 1

print su	

#Scnd part

db  = open("Day9DB")
txt = db.read()
txt = re.sub('(!.)','',txt)
matches = re.findall('<[^>]*>{1}', txt)

print sum(map(lambda x: len(x) - 2, matches))
