Bash book : Command Line Kung Fu, Jason Cannon
===
@https://linuxtrainingacademy.com  
@http://blog.commandlinekungfu.com

### alias

alias d="date +%F"

### disc

df -hT /boot (disc size)
df -mt ext4 (mount)
du -sh /home

### dir

ls -1 (current dir)
tree -L 5

### net & proc

curl ifconfig.me/ip
ps -fu root (with user root)

### user

adduser sam
userdel -r sam
id sam

### shell

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

- substitute
^str1^str2^ ("grep pluch" => ^ch^s^)
^ch (try last command with last substitute)

- multi command
mkdir -p ~/app/{bin,lib}
cp /etc/passwd{,.bak}

### path & usefull

du
df
mount
ps aux
uptime
/etc/login
/etc/passwd
/var/log/syslog
