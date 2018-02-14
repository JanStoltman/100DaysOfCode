import urllib2
import re
import sys

temp = "8022"
while(temp!=""):
    req = urllib2.urlopen("http://www.pythonchallenge.com/pc/def/linkedlist.php?nothing="+temp)

    print(req.geturl())

    html = req.read()
    print(html)
    req.close()

    m = re.search("nothing.*[0-9]",html)
    m = re.search("[0-9].*",m.group(0))
    temp = m.group(0)
    print(temp)
