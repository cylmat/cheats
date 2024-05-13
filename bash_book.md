Bash book
===
_Command Line Kung Fu, Jason Cannon_  
@https://linuxtrainingacademy.com  
@http://blog.commandlinekungfu.com

### alias

alias d="date +%F"
alias most_used="history | awk '{print $2}' | sort | uniq -c | sort -rn | head"
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
```

### file & dir

```
awk `/start/ ,/stop/` <file> (display between two lines)
column -t (table)
cut -c 1-4,18-19 (char)
cut -d, -f2 (delimiter, field)
diff <(date -d 'yesterday') <(date -d 'tomorrow')
find /usr -type f -ls 
grep -E -v "^#|^$" <file> (remove comments & blank)
less -R (output "raw" chars)
ls -1 (current dir)
mount | grep ext4 | awk '{print $3}'
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
lsof -Pni (noport, nohost, ipv4)
netstat -plunt
nohup & (actif après déconnexion)
ps -fu root (with user root)
ps -eo pid,%cpu,cmd | head -1 (display ps header)
ssh-keygen && ssh-copy-id <host>
watch df -h /var (watch disk size
watch -n 1 "ps -ef | grep root" (every 1sec)

- init services
# https://doc.ubuntu-fr.org/script_sysv
sudo update-rc.d <service> defaults 95 10
systemctl --all list-unit-files --type=service
/etc/init.d/<service> start

- disk
df -hT /boot (disc size)
df -mt ext4 (mount)
du -sh /home

- user
adduser sam
userdel -r sam
id sam

- password
gpw 3
```

### shell

```
- last command
<event>:<number>
sudo !!
sudo !w
sudo -c !!
!!
!u
!string (last string)
!^word (use second word)
!$ (use last word: "du -sh !$" => "du -sh lastword")
!!:5 (5th word)
\ls (run "ls" without alias)

- substitute
^str1^str2^ ("grep pluch" => ^ch^s^)
^ch (try last command with last substitute)

- multi command
mkdir -p ~/app/{bin,lib}
cp /etc/passwd{,.bak}
```

### path & usefull

```
du
df
mount
ps aux
uptime
/etc/login
/etc/passwd
/var/log/syslog
```
