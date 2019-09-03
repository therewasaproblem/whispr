import requests
from bs4 import BeautifulSoup
from re import search

url = "http://rss.uol.com.br/feed/noticias.xml"
source_code = requests.get(url)
plain_text = source_code.text
soup = BeautifulSoup(plain_text, 'xml')
titles = soup.find_all('title')

string = "Bolsonaro"

# Return every headline available
def returnHeadlines():
    print("TODAS AS NOTICIAS: \
    ")
    for titulo in titles:
        print(titulo)

# Return the headlines which have the given string parameter
def returnParameterHeadlines(string):
    print("NOTICIAS COM A PALAVRA " + string + ":")
    for titulo2 in titles:
        if string in titulo2.text:
            print(titulo2)
