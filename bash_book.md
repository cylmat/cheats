Bash book
===
_Command Line Kung Fu, Jason Cannon_  
@https://linuxtrainingacademy.com  
@http://blog.commandlinekungfu.com

### alias

alias d="date +%F"
alias most_used="history | awk '{print $2}' | sort | uniq -c | sort -rn | head"
USERID=$(id -u $USER)
```
# Remove header
# usage: df -h | body sort
body() {
  # La variable IFS contient les caractères pour scinder les entrées au clavier.
  # read -r(aw)
  IFS=`read -r header`
  printf "%s\n" "$header"
  "$@"
}
ask() {
  while true; do
    # read -p "txt" VAR is for bash, this for zsh:
    read "SERVER?What?"
    echo "Backup '$SERVER'"
    read "AGAIN?Another (y/n)?"
    [ "$AGAIN" = "y" ] || break
  done
}
```

### file & dir

```
awk `/start/ ,/stop/` <file> (display between two lines)
column -t (table)
cat -A /var/log/bootstrap.log (endline)
cut -c 1-4,18-19 (char)
cut -d, -f2 (delimiter, field)
diff <(date -d 'yesterday') <(date -d 'tomorrow')
find /usr -type f -ls 
find / -maxdepth 1 -xdev -type d | grep -ve '/$' | sort
find -type d -empty -delete
grep -E -v "^#|^$" <file> (remove comments & blank)
grep ^UI /etc/login.defs | awk '{print $NF}'
less -R (output "raw" chars)
ls -1 (current dir)
mount -t ext4 | column -t | grep snap | awk '{print $NF}'
openssl rand -base64 48 | cut -c 1-18
sed '/^abc$/,/^mno$/{//!b};d' <file> (delete lines except between this)
sed -e '1,/sys/d' -e '/games/,$d' (display between two lines)
sort -nrk 2 (numeric, reverse, with key)
tar zxf file.tgz -C <dir>
tree -L 5
uniq -c(ount)
uptime
vim scp://user@host//file
```

### net & proc

```
curl ifconfig.me/ip
curl -sLO <url>
lsof -Pni (noport, nohost, ipv4)
netstat -plunt
nohup & (actif après déconnexion)
ping -c 1 -w 1 google.com (after count, 1sec)
ps -fu root (with user root)
ps -fp $(cat /var/run/docker.pid)
ps -eo pid,%cpu,cmd | head -1 (display ps header)
ssh-keygen && ssh-copy-id <host>
watch df -h /var (watch disk size
watch -n 1 "ps -ef | grep root" (every 1sec)

- init services
# https://doc.ubuntu-fr.org/script_sysv
sudo update-rc.d <service> defaults 95 10
systemctl --all list-unit-files --type=service
/etc/init.d/<service> start

- stop
killall -u <user> sshd
kill -9 (force) -15 (please stop) -1 (hung up)
pkill <cmd>

- disk
df -hT /boot (disc size)
df -mt ext4 (mount)
df -mt ext4 | awk '{sum +=$3}END{print sum}'
du -sh /home
ncdu /home (to install)

- user
adduser sam
userdel -r sam
id sam
gpw 3 (generate password)

- date
TZ: Central Standard Time, Coordinated Universal Time
```
	
### shell

```
- last command
<event>:<number>
sudo !!
sudo !w
sudo -c !!
!# (current/duplicate word)
!!
!u
!string (last string)
!^word (use second word)
!$ (use last word: "du -sh !$" => "du -sh lastword")
!!:5 (5th word)
\ls (run "ls" without alias)
reset
yes "ok" | <cmd>
2>&1 (stderr to stdout)
ls . 2> /dev/null

- loop (for x in $)
for VAR in pers1 pers2 pers3; do echo $VAR; done
for x in $(cut -d: -f1 /etc/passwd); do echo $x; done
df | while read LINE; do echo $LINE; done 

- substitute
^str1^str2^ ("grep pluch" => ^ch^s^)
^ch (try last command with last substitute)

- multi command
mkdir -p ~/app/{bin,lib}
cp /etc/passwd{,.bak}
mv file{.old,.new}
multitail file1 -I file2

- dns
dig (install dnsutils)
dig +short foo.wp.dg.cx
host -t txt foo.wp.dg.cx
```

### path & usefull

```
du
df
mount
openssl rand -base64 48 
ps aux
uptime
/etc/login
/etc/login.defs
/etc/passwd
/var/log/syslog
```
