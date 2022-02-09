# Listen port

## Ifconfig
**apt install iputils-ping**  

## Netcat
**apt install netcat**  
nc 172.24.0.1:80  
nc -l(isten) -v -u(dp) -p <port>    
nc -z(scan) -v 172.24.0.1 20-500
  
## Netstat
netstat -a(ll) -n(umeric) -t(cp)    
netstat -p(rogram) -l(isten) -u(dp) -n(umeric) -t(cp)  
  
## Nslookup
**apt install dnsutils**  
  
## Ping
**apt install iputils-ping**  

## Tcp
tcpflow -i any -C -J port 1234  
tcpdump -v port 9000

Refs
----
* https://guillaume.fenollar.fr/blog/socat-netcat-tester-port-et-envoyer-fichiers/
* https://linuxize.com/post/netcat-nc-command-with-examples/
* https://openmaniak.com/fr/tcpdump.php
