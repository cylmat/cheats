Linux
=====

Awk
---
**Read each line of file or stdin**  
awk '{split($1,n,":");print n[1],$2,$3}' my_file  
awk '{print $1}' RS=' ' FS=: ORS=' ' <<< 'my_input'  

Cat
---
**Get only first string part**  
echo "here is the string" | cut -d' ' -f 1  

Crlf
---
**Dos 2 unix**  
tr -d '\r' < input.file > output.file  
sed 's/^M$//' input.txt > output.txt  

## SHA 
export SHA512=$(curl https://archive.sha512 | cut -d' ' -f 1)  
echo "${SHA512} archive.bin" | sha512sum --check

### Shell
clear: Ctrl+u  

**Bash substitution**
source <(sudo cat /etc/bash.bashrc)

### Ref
* [corporesano.org: Grep Sed Awk](http://www.corporesano.org/doc-site/grepawksed.html)
