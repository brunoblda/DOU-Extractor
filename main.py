import requests

URL = "http://diariooficialhoje.com.br/IN-Jornal-2023_01_10_do2.pdf"
response = requests.get(URL)
open("DOU-2023-01-23.pdf", "wb").write(response.content)