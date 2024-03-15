### USEFULS

Curl download
```
# curl -f (fail silent) -s (silent) -S (show errors) -L (follow redirects)
curl -fsSL https://raw
wget -O- https://raw
fetch -o - https://raw
```

Find
```
# Trouver une expression dans les fichiers
find . -maxdepth 1 -name 'test*' -exec echo {} \;
find . -regex '.*.json' | xargs grep smile
find . -name *.php -type f -exec grep -Hn '$test' {} \;

# find -print0 (no return line)
# xargs -0 (split by 'null') -n1 (one argument by line)
# grep -Hn (with filename:linenum)
find . -name \*.php -type f -print0 | xargs -0 -n1 grep --color -Hn '$test'
```

Grep sed awk
```
# awk /regexp/ -F (field split) $0 (all line) $NF (dernier champs)
awk -F":" '{print $1,$6}' /etc/passwd
cat /etc/passwd | awk -F ":" '{print $1}'
df | awk '/run/ && !/vm/ {print $0}'
```

```
# cut (split tool) -d (delimiter) -f (fields) x-2 (from x to 2)
echo 'A B C D' | cut -d' ' -f 1-3
# tr (translate) -d (delete)
cat /etc/passwd | sort | uniq | tr ':' '-' | tr '[:lower:]' '[:upper:]' | tr –d ’-’
```

Rsync files
```
rsync -av . dest
```

Ports
```
# lsof -i (ipv46) -P (no port) -n (no host) 
sudo lsof -i -P -n | grep LISTEN
sudo lsof -i:22

sudo netstat -tulpn | grep LISTEN
sudo nmap -sTU -O 127.0.0.1

sudo ss -tulpn | grep LISTEN
```
