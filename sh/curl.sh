#/bin/sh
curl -v -c cookies.txt -b cookies.txt https://public.nazk.gov.ua/search

exit 0
curl -v -c cookies.txt -b cookies.txt -X POST -A 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/53.0.2785.143 Chrome/53.0.2785.143 Safari/537.36' \
-H1 'Referer: https://public.nazk.gov.ua/search' -H1 'Origin: https://public.nazk.gov.ua' -H1 'Upgrade-Insecure-Requests:1' \
-H1 'Connection: keep-alive' \
-b1 'session=n843husluj9bgvgjj1ad6g9hg1' \
-d 'page=1&responsiblePositions%5B%5D=1&csrftoken1=5d0e3c9f937d44c171e5e7ecfe1f45c8' \
'https://public.nazk.gov.ua/search' 2>&1 > file.html

cat file.html | egrep -o "Результати пошуку \((.*)\)"