from bs4 import BeautifulSoup
import requests


def getHtml(url):
	"""Get url html and return only img elements"""
	
	html  = requests.get(url).content
	bsObj = BeautifulSoup(html, 'html.parser') 
	imgs  = bsObj.find_all('img')
	return str(imgs)


def main():
	"""Python script which checks if there are any changes
		between html of gamesworkshop and forgeworld websites
		and saved md5s of these htmls after cearing and trimming"""

	gw = getHtml("https://www.games-workshop.com/en-PL/Home")
	fw = getHtml("https://www.forgeworld.co.uk/")

	print(gw)


if __name__ == "__main__":
	main()

