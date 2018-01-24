from urllib.request import urlopen, Request
import hashlib


def getHTML(url = ""): 
	r = Request(url, headers={'User-Agent' : "Day checker"}) 
	return urlopen(r).read()


def md5it(st):
	print(st)
	return hashlib.md5().update(st).hexdigest()


def main():
	md5gw = md5it(getHTML("https://www.games-workshop.com/en-PL/Home"))
	md5fw = md5it(getHTML("https://www.forgeworld.co.uk/"))

	print(md5gw)
	print(md5fw)


if __name__ == "__main__":
	main()


#Clean html to just pics
#Hash it
#Save in db
