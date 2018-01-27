from bs4 import BeautifulSoup
import requests
import hashlib


def getHtml(url):
	"""Get url html and return only img elements"""
	
	html  = requests.get(url).content
	bsObj = BeautifulSoup(html, 'html.parser') 
	imgs  = bsObj.find_all('img')
	return str(imgs)


def computeMD5hash(st):
	m = hashlib.md5()
	m.update(st.encode('utf-8'))
	return m.hexdigest()

def getHash(url):
	try:
		md5 = computeMD5hash(getHtml(url))
	except ConnectionError as e:
		print("Connection error! " + url)


def main():
	"""Python script which checks if there are any changes
		between html of gamesworkshop and forgeworld websites
		and saved md5s of these htmls after cearing and trimming"""

	urlGw = "https://www.games-workshop.com/en-PL/Home"
	urlFw = "https://www.forgeworld.co.uk/"
	
	getHash(urlGw)
	getHash(urlFw)



if __name__ == "__main__":
	main()

