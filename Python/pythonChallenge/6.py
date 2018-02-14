import re
tempNum = 90052
import zipfile as zp
str = []
zipF = zp.ZipFile('pythonChallenge/channel.zip')
while(True):
    filePath = "pythonChallenge/channel/{}.txt".format(tempNum)
    mFile = open(filePath,'r')
    tempStr = mFile.read()
    str.append(zipF.getinfo("{}.txt".format(tempNum)).comment)

    m = re.search("nothing.*[0-9]",tempStr)
    if(m == None):
        break;
    m = re.search("[0-9].*",m.group(0))
    tempNum = m.group(0)
    if(tempStr != "Next nothing is {}".format(tempNum)): 
        print(tempStr)
    print(tempNum)

print "".join(str)
