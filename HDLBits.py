import urllib.request
import http.cookiejar
from bs4 import BeautifulSoup
import os
import json
import sys


def downloadSrc(opener, hosts, itemURL, itemName):
    path = itemName[0: itemName.rfind("/")]
    if not os.path.isdir(path):
        os.makedirs(path)
    if not os.path.isfile(itemName):
        itemHeaders = {'Host': 'hdlbits.01xz.net',
                       'User-Agent': 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:84.0) Gecko/20100101 Firefox/84.0',
                       'Accept': '*/*',
                       'Accept-Language': 'en-US,en;q=0.5',
                       'Accept-Encoding': 'gzip, deflate, br',
                       'Content-Type': 'application/x-www-form-urlencoded',
                       'Origin': 'https://hdlbits.01xz.net',
                       'Connection': 'keep-alive',
                       'Referer': hosts+itemURL}
        itemInfo = {'tc': itemURL[6:],
                    'name': '0'}
        itemData = urllib.parse.urlencode(itemInfo).encode()

        itemReq = urllib.request.Request(hosts+'/load.php', headers=itemHeaders, data=itemData, method='POST')
        itemRes = opener.open(itemReq)
        itemHTML = itemRes.read().decode('utf-8')
        itemJson = json.loads(itemHTML)
        itemSrcCode = itemJson['data']

        print(itemName, itemInfo['tc'], itemURL)
        fd = open(itemName, mode="w", encoding="utf-8")
        fd.write(itemSrcCode)
        fd.close()
    else:
        pass


if __name__ == '__main__':

    userName = sys.argv[1]
    password = sys.argv[2]

    loginInfo = {'vlg_username': userName,
                 'password': password,
                 'login': 'Login'}

    loginData = urllib.parse.urlencode(loginInfo).encode()

    loginHeaders = {'Host': 'hdlbits.01xz.net',
                    'User-Agent': 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:84.0) Gecko/20100101 Firefox/84.0',
                    'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
                    'Accept-Language': 'en-US,en;q=0.5',
                    'Accept-Encoding': 'gzip, deflate, br',
                    'Content-Type': 'application/x-www-form-urlencoded',
                    'Content-Length': '58',
                    'Origin': 'https://hdlbits.01xz.net',
                    'Connection': 'keep-alive',
                    'Referer': 'https://hdlbits.01xz.net/wiki/Special:VlgLogin',
                    'Cookie': 'vlgsession=0',
                    'Upgrade-Insecure-Requests': '1'}

    loginURL = 'https://hdlbits.01xz.net/wiki/Special:VlgLogin'

    loginReq = urllib.request.Request(loginURL, headers=loginHeaders, data=loginData, method='POST')

    cookieJar = http.cookiejar.CookieJar()

    opener = urllib.request.build_opener(urllib.request.HTTPCookieProcessor(cookieJar))

    loginRes = opener.open(loginReq)

    ###########################################################################

    print(loginData)
    cookieStr = ''
    for item in cookieJar:
        cookieStr = cookieStr + item.name + '=' + item.value + ';'

    print(cookieStr)

    ###########################################################################

    basicHeaders = {'User-Agent': 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:84.0) Gecko/20100101 Firefox/84.0'}
    hosts = 'https://hdlbits.01xz.net'

    problemSetURL = 'https://hdlbits.01xz.net/wiki/Problem_sets'
    problemSetReq = urllib.request.Request(problemSetURL, headers=basicHeaders)
    problemSetRes = opener.open(problemSetReq)
    problemSetHTML = problemSetRes.read().decode('utf-8')

    loginStatus = problemSetHTML.find(userName)
    if not loginStatus:
        print("login failed")
        exit()

    problemSetSoup = BeautifulSoup(problemSetHTML, 'html.parser')
    problemSetTagH2 = problemSetSoup.find_all("h2")

    ###########################################################################

    i = 0
    j = 0
    k = 0
    categoryIter = problemSetTagH2[2]
    categoryDir = ''
    subCategoryDir = ''
    subSubCategoryDir = ''

    while(1):
        if not categoryIter:
            break
        if categoryIter.name == 'h2':
            i += 1
            j = 0
            categoryDir = "./" + str(i) + " " + categoryIter.contents[0]['id'].split(':_')[-1]
            print(categoryDir)

        elif categoryIter.name == 'h3':
            j += 1
            k = 0
            subCategoryDir = categoryDir+'/'+str(i)+"."+str(j)+" "+categoryIter.contents[0]['id'].split(':_')[-1]
            print(subCategoryDir)

        elif categoryIter.name == 'h4':
            k += 1
            subSubCategoryDir = subCategoryDir+'/'+str(i)+"."+str(j)+"."+str(k)+" "+categoryIter.contents[0]['id'].split(':_')[-1]
            print(subSubCategoryDir)

        elif categoryIter.name == 'ul':
            a_list = categoryIter.find_all('a')
            for a in a_list:
                itemURL = a['href']
                itemName = a['title']+".v"
                itemName = itemName.replace('/', "_")
                if j == 0:
                    itemName = categoryDir + '/' + itemName
                elif k == 0:
                    itemName = subCategoryDir + '/' + itemName
                else:
                    itemName = subSubCategoryDir + '/' + itemName

                itemState = a.span['title'].split(": ")[1]

                if itemState == 'Completed':
                    downloadSrc(opener, hosts, itemURL, itemName)

        else:
            pass
        categoryIter = categoryIter.next_sibling
