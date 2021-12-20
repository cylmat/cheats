# Listen port
nc -lvu(p) <port>

tcpflow -i any -C -J port 1234
tcpdump -v port 9000

Refs
----
* https://guillaume.fenollar.fr/blog/socat-netcat-tester-port-et-envoyer-fichiers/
* https://linuxize.com/post/netcat-nc-command-with-examples/
* https://openmaniak.com/fr/tcpdump.php
