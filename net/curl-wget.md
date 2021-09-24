Curl
----
**In target dir**   
curl -fLo ~ /target/dir --create-dirs https://source-of.file

Wget
----
wget [OPTION]... [URL]...  
--(O)utput-document=FILE    (write documents to FILE)  
--directory-(P)refix=PREFIX (save files to PREFIX/..)  
--(o)utput-file LOGFILE     (log messages to LOGFILE)  
--(a)ppend-output=LOGFILE   (append log messages to LOGFILE)  
--spider                    (don't download anything, dry-run)  
--(d)ebug --(q)uiet  

**Renamed in target dir**  
mkdir /dir && wget -O /dir/rename.zip https://my/url/file.zip  



Network
- arp
- dnsdomainname
- iptables -L (rules) -n -v -S (specification)
- nc (netcat)
- netstat -tpln
- nslookup: (name server lookup) is a tool used to perform DNS lookups in Linux, used to display DNS details, such as the IP address of a particular computer
- telnet
- traceroute
