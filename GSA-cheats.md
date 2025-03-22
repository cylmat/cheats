# Grep-Sed-Awk text processing

1. GSA
    - Grep
    - Sed
    - Awk
    - Perl
2. Text
    - Cat / Tac
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
# Usage
# -f <fromfile> -B(efore) -A(fter) -c(ount)
# -E(xtended) -w(ords only) -x(lines only) -o(nly matching)
# -R(ecursive) -n(umber) -H (with filename) -l(ines matches)
grep -B 5 -A 10 -o REGEXP <file>
grep -F "[my\!string)" match exact "[my\!string)"
grep REG - (wait for INPUT) or cat "text" | grep REG

# Exclude
# -F(ixed string, no regexp) -m(ax results)
# -in(v)ert (NOT match) -h (without filename)
# -z (end data with NULL) -L(ines NO-matches)
grep --include="*.js" --exclude-dir={.bzr,.git} -r <div> <regexp>

# Match whole word and display numbers
grep -nr <dir> -we <wordregexp>

# Grep BRE (Basic RE) vs grep -E(xtended)
# ?, +, {, |, (, and ) as literals
grep '(p'    -> "(p"
grep '\(p'   -> unmatched ")"
grep -E '\(p'   -> "(p"
grep -E '(p'    -> unmatched ")"

# Misc
grep '^root' /etc/passwd   (<=> cat /etc/passwd | grep '^root')
```

### Sed (Stream EDitor)
https://www.gnu.org/software/sed/manual/sed.html#sed-commands-summary
- Replace, insert and filters

```
# Usage
# -i(nplace, edit file) -E(xtended) -n (quiet, no print pattern)
# -z(eoline with NULL) -e(xpression, same without)
# -f(ilescript.sed)
sed -i.bak 's/text/sub\/stit/flag' FILE (save <file>.bak)
sed -i 's|text|sub/stit|flag' -f script.sed FILE

# Commands
# sed '<addr>{cmd;cmd2;cmd3}/flag
# (!exclude) (:label) ($last line) (first~step) (=num line)
sed -n '/apple/!s/hello/world/' (replace if NOT match "apple")
sed -n '4,17!s/hello/world/'    (replace from 1 to 3, and 18 to eof)
sed -n '4,/(mylastmatch)/p'     (print from 4 to match)
sed -n '4,+3p'                  (from 4 to 7)
sed -n '0~4p'                   (print from 0, every 4 lines)
sed ':a;N;$!ba;s/\n/./g'        (replace newlines with dot)

# Add and delete (with /x\)
sed '/^$/d' <file>        (remove empty lines)
sed '3,25d' file          (remove from 3 to 25)
sed '/Once/i\Chapter 1'   (insert line before patterns)
sed '/happily/a\The end'  (add line after patterns)

# Filters
# -n (quiet, no print pattern) -p(rint, like grep)
sed "2p" -n FILE          (print 2nd "paragraph")
sed "2,9p" -n FILE        (print 2nd to 9th line)
sed '/pattern/,7p' -n     (from all patterns to +7 lines)
sed '/sstart/,/send/p' -n (from start pattern to end pattern)
sed '$p' FILE -n          (print last line)

# Flag modifyers and regexp
(d)elete, (i)nsensitive/(i)nsert, (g)lobal, (P)rint, (w)rite
sed "s/\([\0-9\]\)-\([\0-9\]\)/\2-\1/" (not using -E)
sed -E "s/([0-9])-([0-9])/\2-\1/" ("\num" rearrange order)

# Multi
# (N)ext line, (P)rint, (D)elete next line
sed 'N;s/\n/OK\n/g;P;D;' <file>  (add OK at eoline)

# Misc
sed -E 's/pattern/new/' <<< "input string"
sed -i -E "/^\s*$/d" FILE   (remove empty lines)
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

### Perl

```

```



--------------------------------------------------------------------------------------
## 2. Text

### Cat / Tac

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
# -u(nified, readable git-like patch file) -y (site by site)
# -w (ignore all spaces) -b (ignore space change) -B (ignore empty line) -Z(eol space)
# -r(ecursive directories)  -N (absent file as empty)
# (in script: -q are differ ? -s are same ?)
diff <file1> <file2>

diff - <file2>   (diff with INPUT and file2)
diff -qr <dir1> <dir2>   (directory diff git-style)
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
  
