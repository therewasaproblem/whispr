import requests
from bs4 import BeautifulSoup
from re import search

url = "http://rss.uol.com.br/feed/noticias.xml"
source_code = requests.get(url)
plain_text = source_code.text
soup = BeautifulSoup(plain_text, 'xml')
titles = soup.find_all('title')

string = "Bolsonaro"

print("TODAS AS NOTICIAS: \
")
for titulo in titles:
    print(titulo)

print("NOTICIAS COM A PALAVRA " + string + ":")
for titulo2 in titles:
    if string in titulo2.text:
        print(titulo2)
        
