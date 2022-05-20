import urllib.request
from bs4 import BeautifulSoup
import pandas as pd

fondos = ['BGF Euro Short Duration Bond A2 EUR',
        'iShares Euro Govt Bd Idx (LU) A2 EUR',
        'iShares Em Mkts Govt Bd Idx (LU) A2 EURH',
        'iShares Europe Equity Index (LU) A2 EUR',
        'iShares Dev Rl Ett Idx (IE) Instl Acc €',
        'iShares North America Eq ldx (LU) A2 USD',
        'iShares Japan Equity Index (LU) A2 USD',
        'iShares Emerging Mkts Eq Idx (LU) A2 USD',
        ]
urls = [#BGF Euro Short Duration Bond A2 EUR
        'https://www.morningstar.es/es/funds/snapshot/snapshot.aspx?id=F0GBR04AS2',
        #iShares Euro Govt Bd Idx (LU) A2 EUR
        'https://www.morningstar.es/es/funds/snapshot/snapshot.aspx?id=F00000OYMY',
        #iShares Em Mkts Govt Bd Idx (LU) A2 EURH
        'https://www.morningstarfunds.ie/ie/funds/snapshot/snapshot.aspx?id=F00000X4QX',
        #iShares Europe Equity Index (LU) A2 EUR
        'https://www.morningstar.es/es/funds/snapshot/snapshot.aspx?id=F00000OYMI',
        #iShares Dev Rl Ett Idx (IE) Instl Acc €
        'https://www.morningstar.es/es/funds/snapshot/snapshot.aspx?id=F00000PJME',
        #iShares North America Eq ldx (LU) A2 USD
        'https://www.morningstar.es/es/funds/snapshot/snapshot.aspx?id=F00000OYNC',
        #iShares Japan Equity Index (LU) A2 USD
        'https://www.morningstar.es/es/funds/snapshot/snapshot.aspx?id=F00000OYN8',
        #iShares Emerging Mkts Eq Idx (LU) A2 USD
        'https://www.morningstar.es/es/funds/snapshot/snapshot.aspx?id=F00000P5RU']

participaciones = [22.45, 8.34, 13.22, 11.77, 31.32, 7.41, 6.22, 9.77]

urlUSD = 'https://www.xe.com/es/currencyconverter/convert/?Amount=1&From=USD&To=EUR'
html2 = urllib.request.urlopen(urlUSD).read()
soup2 = BeautifulSoup(html2)
tagsUSD = soup2.find_all('p',class_='result__BigRate-sc-1bsijpp-1 iGrAod')
EURUSD = float(tagsUSD[0].text.replace(' Euros','').replace(',','.'))
k=0

for url in urls:
    html = urllib.request.urlopen(url).read()
    soup = BeautifulSoup(html)
    tags = soup.find_all("td",class_="line text")
    valor = float(tags[0].text.split('\xa0')[1].replace(',','.'))
    cambio = tags[1].text.replace('\n','').replace(' ','')
    tags2 = soup.find_all("span",class_="heading")
    fecha = tags2[0].text
    if k not in [5,6,7]:
        total = valor*participaciones[k]
    elif k in [5,6,7]:
        total = valor*participaciones[k]*EURUSD
        
    fondo = [fondos[k],valor,cambio,total,fecha]
    
    if k==0: df = pd.DataFrame([fondo])
    else: df = pd.concat([df,pd.DataFrame([fondo])],axis=0)
    k+=1
	
df.columns=['Activo','Valor','Cambio','ValorTotal','Fecha']
df = df.reset_index(drop=True)

valor_total = df.ValorTotal.sum()

import sqlite3
conn = sqlite3.connect('MisFondos2.sqlite')

cur = conn.cursor()
listOfTables = cur.execute(
  """SELECT name FROM sqlite_master WHERE type='table'
  AND name='FONDOS'; """).fetchall()
  
if listOfTables == []:
    df.to_sql('FONDOS',conn,index=False)
else:
    df.to_sql('FONDOS',conn,index=False,if_exists='append')
	
conn.close()

# Mailing
import smtplib

server = smtplib.SMTP('smtp.gmail.com',587)
server.starttls()
server.login('rafazamb@gmail.com','ojydeysabghqzutg')
server.sendmail("rafazamb@gmail.com","rafael@thebridgeschool.es",'Subject: {Fondos}\n\n Valor: ' +str(valor_total))