Grep
===

### Ref
* [corporesano.org: Grep Sed Awk](http://www.corporesano.org/doc-site/grepawksed.html)
* https://www.funix.org/fr/unix/awk.htm
* https://www.linuxtricks.fr/wiki/awk-chercher-et-manipuler-du-texte-mais-pas-que

Grep  
@https://www.malekal.com/grep-egrep-fgrep-rgrep-quelles-sont-les-differences/
  
Sed
---
sed -E 's/pattern/new/' <<< "input string"

Awk
---
**Read each line of file or stdin**  
awk '{split($1,n,":");print n[1],$2,$3}' my_file  
awk '{print $1}' RS=' ' FS=: ORS=' ' <<< 'my_input'  

sample to clear----------  
awk '{ print "echo "$0"" | "/bin/sh"}' file.txt
cat file.txt | tr -d '\r' | xargs -L 1 -i echo {}

cat file.txt | while read in; do echo "$in"; done
while IFS='$\n' read line; do echo "$line"; done < file.txt
xargs echo "\n" - <file.txt
xargs -n 1 -I{} echo Blah {} blabla {}.. < <(seq 1 5)

---
# Utils
### cut
**select fields**  
echo 'A B C D' | cut -f 1-3  

**change delim**  
echo 'Pierre,John,Satia,Henrick' | cut -d ',' -f -2

**last 2 characters** 
echo 'This' | cut -c -2

### sort

### tr
cat file.txt | tr [:lower:] [:upper:]  
cat file.txt|tr –d ’ ’

### uniq
