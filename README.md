### USEFULS
Download
```
curl -fsSL https://raw
wget -O- https://raw
fetch -o - https://raw
```

Find
```
find . -maxdepth 1 -name 'test*' -exec echo {} ;
find . -regex '.*.json' | xargs grep smile
find . -name *.php -type f -exec grep -Hn '$test' {} ;
find | xargs -n1 find . -name *.php -type f -print0 | xargs -0 -n1 grep -Hn '$test'
```

File
```
rsync -av . dest
```

Ports
```
sudo lsof -i -P -n | grep LISTEN
sudo lsof -i:22

sudo netstat -tulpn | grep LISTEN
sudo nmap -sTU -O 127.0.0.1

sudo ss -tulpn | grep LISTEN
```
