[Scripts_install.sh](https://github.com/cylmat/cheats/blob/main/.home/scripts_install.sh)

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
