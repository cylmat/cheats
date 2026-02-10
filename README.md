### Uuseful cheats

---
One page cheats: [Cylmat/Git OnePage](https://github.com/cylmat/cheats/blob/main/onepage/git-one-cheat.md) - [Cylmat/Vim OnePage](https://github.com/cylmat/cheats/blob/main/onepage/vim-one-cheat.md) - [Cylmat/VsCode OnePage](https://github.com/cylmat/cheats/blob/main/onepage/vsc-one-cheat.md) - [Cylmat/Zsh OnePage](https://github.com/cylmat/cheats/blob/main/onepage/zsh-one-cheat.md)

Detailed cheats: [Cylmat/Git Cheats](https://github.com/cylmat/cheats/blob/main/GIT-cheats.md) - [Cylmat/GSA Cheats](https://github.com/cylmat/cheats/blob/main/GSA-cheats.md) - [Cylmat/Vim Cheats](https://github.com/cylmat/cheats/blob/main/VIM-cheats.md)    
   

Bash
[Onceupon/Bash Oneliner](https://github.com/onceupon/Bash-Oneliner) 
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

Date
```
date '+%Y-%m-%d'
```

FAKER
```
pip install Faker
echo "from faker import Faker \nfake=Faker()\nprint(fake.text(2500))" | python3 > ~/fake

# dictionnary data
apt install -y wamerican && cat /usr/share/dict/words 
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

Hexa
```
vim -b(inary) then :%!xxd
```

Rsync files
```
rsync -av src dest
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

Printf
```
printf '%s\n' this is a list of of random words with duplicate words | sort -u
printf '%d\n' {1..9} 10 11 | sort -n
```

Process
```
ps aux (all user withtty)
- detail of process: extra(F)ull, BSD(l)ong, ww(ide unlimited)
ps -Flww -p <PID>
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

Watch
```
watch ls mon_dossier_resultat
```
