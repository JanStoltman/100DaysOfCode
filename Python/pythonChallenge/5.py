import urllib2,pickle

url = "http://www.pythonchallenge.com/pc/def/banner.p"
req = urllib2.urlopen(url).read()
data = pickle.loads(req)

print data
#for line in data: 
#    print ''.join(elem[0]*elem[1] for elem in line)
