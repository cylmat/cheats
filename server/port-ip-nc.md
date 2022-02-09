# Listen port

## Netcat
**apt install netcat**  
nc -l(isten) -v -u(dp) -p <port>    
nc -z(scan) -v 172.24.0.1 20-500

tcpflow -i any -C -J port 1234
tcpdump -v port 9000
  
## Netstat

Refs
----
* https://guillaume.fenollar.fr/blog/socat-netcat-tester-port-et-envoyer-fichiers/
* https://linuxize.com/post/netcat-nc-command-with-examples/
* https://openmaniak.com/fr/tcpdump.php
