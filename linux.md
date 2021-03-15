Linux
=====

### Awk
**Read each line of file or stdin**  
awk '{split($1,n,":");print n[1],$2,$3}' my_file  
awk '{print $1}' RS=' ' FS=: ORS=' ' <<< 'my_input'  

### Shell
clear: Ctrl+u  

**Bash substitution**
source <(sudo cat /etc/bash.bashrc)

### Ref
* [corporesano.org: Grep Sed Awk](http://www.corporesano.org/doc-site/grepawksed.html)
