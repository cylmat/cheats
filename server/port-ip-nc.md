# Listen port

## Ifconfig
_apt install iputils-ping_  

## Netcat
_apt install netcat_  
nc 172.24.0.1:80  
nc -l(isten) -v -u(dp) -p <port>    
nc -z(scan open) -v 172.24.0.1 20-500
  
## Netstat
_apt install net-tools_  
netstat -a(ll) -n(umeric) -t(cp) 2>&1    
netstat -p(rogram) -l(isten) -u(dp) -n(umeric) -t(cp)  
  
## Nmap
_apt install nmap_  
nmap 192.168.100.1/24 -p 1-80  
nmap -sT(cp) -p- 10.10.1.1  
(-p-: port 1-65535)      
  
## Nslookup
_apt install dnsutils_  
nslookup exemple.com  
  
## Ping
_apt install iputils-ping_    

## Tcp
tcpflow -i any -C -J port 1234  
tcpdump -v port 9000
  
## Telnet
_apt install telnet_  
telnet <remote> <port>  
  
### sample
ifconfig | grep "\binet\b.*\b127.0.0.1\b" | awk '{print $2}' | cut -d '.' -f 1  

---
Refs
----
* https://guillaume.fenollar.fr/blog/socat-netcat-tester-port-et-envoyer-fichiers/
* https://linuxize.com/post/netcat-nc-command-with-examples/
* https://openmaniak.com/fr/tcpdump.php
