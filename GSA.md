# Grep-Sed-Awk text processing

GSA
- Grep
- Sed
- Awk
Text
- Cut
- Diff
- Sort
- Tr(im)
- Uniq
- Wc
Files
- Find
- Head
- Tail
- Xargs
Misc
- Join
- Jq  
- Paste



### Data

```

```

--------------------------------------------------------------------------------------
## 1. GSA

### Grep

```
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

### Sort

```

```

### Tr

```
cat file.txt | tr [:lower:] [:upper:]  
cat file.txt|tr –d ’ ’
```

### Uniq

```

```

### Wc

```

```



--------------------------------------------------------------------------------------
## 3. Files

### Find

```

```

### Head

```

```

### Tail

```

```

### Xargs

```

```


--------------------------------------------------------------------------------------
## 4. Misc

### Join

```

```

### Jq

```

```

### Paste

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
  
