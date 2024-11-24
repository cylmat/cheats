### USEFULS

Awk
```
# awk /regexp/ -F (field split) $0 (all line) $NF (dernier champs)
awk -F":" '{print $1,$6}' /etc/passwd
cat /etc/passwd | awk -F ":" '{print $1}'
df | awk '/run/ && !/vm/ {print $0}'

# begin (once on start) and end (once too)
awk 'BEGIN{print "ok"} /system/{++n} END{print "in",n,"line"}' /etc/passwd
```

Bash
```
for i in `seq 1 15`;do echo "$i";done
```

Curl download
```
# curl -f (fail silent) -s (silent) -S (show errors) -L (follow redirects)
curl -fsSL https://raw
wget -O- https://raw
fetch -o - https://raw
```

Crypto
```
echo -n Welcome | md5sum
md5sum <<<"my string"
printf '%s' "my string" | md5sum
```

Cut tr head sort
```
# cut (split tool) -d (delimiter) -f (fields) x-2 (from x to 2)
echo 'A B C D' | cut -d' ' -f 1-3

# tr (translate) -d (delete) 'A' to 'B'
cat /etc/passwd | sort | uniq | tr ':' '-' | tr '[:lower:]' '[:upper:]' | tr –d ’-’

# join output
join <(sort fichier1.txt) <(sort fichier2.txt)
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

Grep Sed Awk
```
### Grep

grep "\(e\|f\)" /etc/passwd
grep -E "(e|f)" /etc/passwd

### Sed

# sed -n (silent)
echo "alpha" | sed -e 's/a/b/g'
sed -e 's/a/b/g' <(echo "alpha")
```

Generate pass
```
PASS=date +%s | sha256sum | base64 | head -c 16 ; echo
echo -n $PASS | base64 -w 0
```

Rsync files
```
rsync -av . dest
```

Pipe and process
```
# multiprocess
diff <(date -d 'yesterday') <(date -d 'tomorrow')
# heredoc
sed 's/We/They/; s/Linux/Windows/' <<< "We love Linux."
# var
var=`cat /etc/passwd` ; echo ${#var}
```

Networks & Ports
- ipconfig.me

```
# https://manned.org/lsof
# lsof -i (ipv46) -P (no port) -n (no host) 
sudo lsof -i -P -n | grep LISTEN
sudo lsof -i:22

# https://man7.org/linux/man-pages/man8/netstat.8.html
sudo netstat -ano | grep 80
sudo netstat -tulpn | grep LISTEN
# scan TCP, scan UDP, enable OS detect
sudo nmap -sTU -O 127.0.0.1

# https://www.tcpdump.org
tcpdump -n -i ppp0

# netcat
# https://www.varonis.com/blog/netcat-commands
(n)o domain resolv
nc -v -n 8.8.8.8 1-1000

# listen on locahost:80
nc -l localhost 80

# https://manned.org/ss.8
# socket statistics
sudo ss -plunt | grep LISTEN
```
