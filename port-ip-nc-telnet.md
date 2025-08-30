# Listen port

## Arp
_apt install net-tools_     

```
arp -a(ll)
```

## Ifconfig
_apt install iputils-ping_  

## Netcat
_apt install netcat_  

```
nc 172.24.0.1:80  
nc -l(isten) -v -u(dp) -p <port>    
nc -z(scan open) -v 172.24.0.1 20-500  
nc -lnp 9999
```
  
## Netstat
_apt install net-tools_  

```
netstat -a(ll) -n(umeric) -t(cp) 2>&1    
netstat -p(rogram) -l(isten) -u(dp) -n(umeric) -t(cp)  
netstat -r(outing)
```
  
**check every opened ports**  
netstat -plunt | grep LISTEN
  
## Nmap

_apt install nmap_  
```
nmap 192.168.100.1/24 -p 1-80  
nmap -sT(cp) -p- 10.10.1.1  
(-p-: port 1-65535)
```    
  
## Nslookup

_apt install dnsutils_  
nslookup exemple.com  
  
## Ping

_apt install iputils-ping_    

### Socat

```
socat -d -d READLINE,history=$HOME/.http_history TCP4:www.domain.org:www,crnl
# Vous pouvez saisir du texte avec la bibliothèque readline et il sera envoyé en TCP à www.domain.org sur le port 80 (www). Pratique pour simuler des requêtes HTTP à la main.

socat TCP4-LISTEN:www TCP4:www.domain.org:www
# C'est un simple transfert de données entre 2 flux TCP. Tout ce qui arrive sur le port 80 (www) de la machine locale est envoyé vers www.domain.org et inversement.

socat -u TCP4-LISTEN:3334,reuseaddr,fork OPEN:/tmp/in.log,creat,append
# Dans cet exemple, socat va écrire tout ce qu'il reçoit sur le port 3334 dans un fichier.
```

## Tcp

```
tcpflow -i any -C -J port 1234  
tcpdump -v port 9000
```
  
## Telnet
_apt install telnet_  

```
telnet <remote> <port>
```
  
### sample

```
ifconfig | grep "\binet\b.*\b127.0.0.1\b" | awk '{print $2}' | cut -d '.' -f 1
```

---
Refs
---

* https://openmaniak.com/fr/tcpdump.php
* https://linuxize.com/post/netcat-nc-command-with-examples
* https://guillaume.fenollar.fr/blog/socat-netcat-tester-port-et-envoyer-fichiers
