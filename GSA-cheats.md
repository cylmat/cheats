# Grep-Sed-Awk text processing

1. GSA
    - Grep
    - Sed
    - Awk
2. Text
    - Cat
    - Cut
    - Diff
    - Head-Tail
    - Tail
    - Sort
    - Tr
    - Uniq
    - Wc
4. Files
    - Find
    - Xargs
5. Misc
    - Fmt
    - Join-Paste
    - Jq  
    - Shuf

```
### Fake data
pip install Faker && echo "from faker import Faker \nfake=Faker()\nprint(fake.text(2500))" | python3 > /tmp/fake
apt install -y wamerican && cat /usr/share/dict/words
tr -dc '[:graph:]' < /dev/urandom | head -c 200
```



--------------------------------------------------------------------------------------
## 1. GSA

### Grep

```
grep '^root' /etc/passwd   (<=> cat /etc/passwd | grep '^root')

# -li(n)e -(w)ord -(r)ecursive -r(e)gexp
* grep -nwr 'dossier' -e 'expression'  

# Recherche uniquement dans les fichiers .php
grep --include=*.php -rnw 'dossier de recherche' -e 'expression à rechercher' --exclude-dir=/etc
```

### Sed

```
sed -E 's/pattern/new/' <<< "input string"
```

### Awk

```
# Read each line of file or stdin
awk '{split($1,n,":");print n[1],$2,$3}' my_file  
awk '{print $1}' RS=' ' FS=: ORS=' ' <<< 'my_input'

awk '{ print "echo "$0"" | "/bin/sh"}' file.txt
cat file.txt | tr -d '\r' | xargs -L 1 -i echo {}

cat file.txt | while read in; do echo "$in"; done
while IFS='$\n' read line; do echo "$line"; done < file.txt
xargs echo "\n" - <file.txt
xargs -n 1 -I{} echo Blah {} blabla {}.. < <(seq 1 5)
```



--------------------------------------------------------------------------------------
## 2. Text

### Cat

```
# -n(umber lines) -b(number without blank)
# -v(noprinting) -E(eol$) -T(^I Tabs)
# -e(=vE) -t(=vT) -A(ll=vET) 
cat -A fichier1.txt     (display "^Iwith tabs$")

# sample
cat fichier1.txt fichier2.txt fichier3.txt > concatenation.txt
cat f - g               (Output f's contents, then input, then g's contents)
cat - > path/to/file    (Write `stdin` to a file:)
Buffer=`< /etc/passwd`  (<=> Buffer=`cat /etc/passwd`)
```

### Cut

```
# select fields
echo 'A B C D' | cut -f 1-3  

# change delimiter
echo 'Pierre,John,Satia,Henrick' | cut -d ',' -f -2

# last 2 characters
echo 'This' | cut -c -2
```

### Diff

```

```

### Head-Tail

```
head -n 5 <file>     (show first 5 lines)
head -c 5 <file>     (show first 5 chars)

# -li(n)es -f(ollow) -s(leep)
tail -n 5 <file> -v  (show last 5 lines)
tail -n +25 <file>   (show from line 25 to eof)
tail -f <file> -s 3  (watch file every 3sec)
```

### Sort

```

```

### Tr (trim)

```
cat file.txt | tr [:lower:] [:upper:]  
cat file.txt|tr –d ’ ’
```

### Uniq

```

```

### Wc (word counts)

```

```



--------------------------------------------------------------------------------------
## 3. Files

### Find

```

```

### Xargs

```

```



--------------------------------------------------------------------------------------
## 4. Misc

### Fmt

```
fmt = format -t (indentation) -s (divise longues lignes) -u (uniforme espaces) -w (line width)

shuf -n 100 /usr/share/dict/words | fmt -w 72

# with remove of proper nouns and possessives
(sed -e "/^[A-Z]/d" -e "/'s\$/d" | shuf -n 100 | fmt -w 72) </usr/share/dict/words
```

### Join-Paste

use "sort -k 1b,1 file1" before
```
# merge 2 files with common column with ',' as sep (t)
# on field3 of file(1) with field5 of file(2)
# with (a) line for each unpairable line for file1
# (o)n format "1.1,2.2,1.2" 
join -t ',' -1 3 -2 5 -a 1 -o 1.1,2.2,1.2 file1 file2
   
cat file1 | join - file2
```

### Jq

```

```

### Shuf

```

```

---
@ref
- [corporesano.org: Grep Sed Awk](http://www.corporesano.org/doc-site/grepawksed.html) 
- [Manipulation de texte avancée - gitlab.mbb.cnrs.fr](https://gitlab.mbb.cnrs.fr/f/site/form1/ttext)
Grep  
* https://www.malekal.com/grep-egrep-fgrep-rgrep-quelles-sont-les-differences/
Sed
* https://www.funix.org/fr/unix/awk.htm
Awk
* https://www.linuxtricks.fr/wiki/awk-chercher-et-manipuler-du-texte-mais-pas-que
  
