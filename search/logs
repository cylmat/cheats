TAIL
----
tail -f  var/logs/dev.log | awk '
  /INFO/ {print "\033[32m" $0 "\033[39m"}
  /DEBUG/ {print "\033[31m" $0 "\033[39m"}'

tail -f var/logs/dev.log | sed --unbuffered \
    -e 's/\(.*INFO.*\)/\o033[32m\1\o033[39m/' \
    -e 's/\(.*DEBUG.*\)/\o033[31m\1\o033[39m/'

tail -f var/logs/dev.log | perl -pe 's/.*DEBUG.*/\e[1;31m$&\e[0m/g'

u="this is a test" var=${u:10:4} echo "${var}"

SUBSTR
------
**terminal size**
export SIZE_TERM=$(stty size | cut -d ' ' -f 2)
read myrows mycols < <(stty size)

cut -c -$SIZE_TERM file
grep -Eo '.{80}' file
awk '{print substr($0,1,80)}' file.txt
sed 's/^\(.\{80\}\).*$/\1/' file.txt

*******
http://nojhan.github.io/colout/
*******

**reorganize**
[//]: sed -E 's/(B1:.*)(A1:.*)/\2 \1/' ip.txt"
[//]: awk -F'A1:' '{print $1 ~ /B1:/ ? FS $2 " " $1 : $0}' ip.txt

awk -F":" '{print $1,$6}' /etc/passwd
echo "Beam goes bla" | awk '/Beam/ {print $3}'

TPUT
----
freeze: tput smcup
back: tput rmcup

```
red=$( tput -Txterm setaf 1 )
norm=$( tput -Txterm sgr0 )
bold=$( tput -Txterm bold )
```
tail -F myfile.log | sed "s/\(.ERROR.*\)/$red$bold\1$norm/g"

grep
----
alias grep='grep --color=auto'
grep "\(INFO\|SEVERE\)" /var/log/logname

grep -Eo "[[:digit:]]{5}" 
grep -Po '(?<=_)\d+' 

awk
---
grep --color=always "\(INFO\|SEVERE\)" /var/log/logname | tail -f | awk '{ print $1 }'

tail -f /var/log/messages | awk '{if ($5 ~ /INFO/) print "\033[1;32m"$0"\033[0m"; else if ($1 ~ /SEVERE/) print "\033[1;31m"$0"\033[0m"; else print $0}'

***
name='someletters_12345_moreleters.ext'

echo $name | sed 's/[^0-9]*//g'    # 12345
echo $name | tr -c -d 0-9          # 12345

echo $name | sed 's/[^0-9]*\([0-9]\{1,\}\).*$/\1/'
perl -e 'my $name='$name';my ($num)=$name=~/(\d+)/;print "$num\n";'

regex=[^0-9]*([0-9]{1,}).*$; \
[[ $name =~ $regex ]] && echo ${BASH_REMATCH[1]}

str='someletters_12345_morele34ters.ext'
s1="${str#"${str%%[[:digit:]]*}"}"   # strip off non-digit prefix from str
s2="${s1%%[^[:digit:]]*}"            # strip off non-digit suffix from s1
echo "$s2"    

> var="someletters_12345_moreletters.ext"
> digits=$( echo $var | sed "s/.*_\([0-9]\+\).*/\1/p" -n )
> echo $digits
12345
***



COLORTAIL
-------------------------------------------
```
#!/usr/bin/perl -w

while(<STDIN>) {
    my $line = $_;
    chomp($line);
    for($line){
        s/==>.*<==/\e[1;44m$&\e[0m/gi;          #tail multiples files name in blue background
        s/.*exception.*|at .*/\e[0;31m$&\e[0m/gi;  #java errors & stacktraces in red
        s/info.*/\e[1;32m$&\e[0m/gi;            #info replacement in green
        s/debug.*/\e[1;33m$&\e[0m/gi;           #debug replacement in yellow
    }
    print $line, "\n";
}
```
tail -f var/logs/dev.log | perl colortail.pl
----------------------------------------------

TAIL
----
tail -f /var/log/mylogfile | colout '^(\w+ \d+ [\d:]+)|(\w+\.py:\d+ .+\(\)): (.+)$' white,black,cyan bold,bold,normal

tail -f <file> | fgrep "string" | sed 's/stuff//g' >> output.txt
tail -f <file> | fgrep --line-buffered "string" | sed 's/stuff//g' >> output.txt

-----------------------------------------------------------------

GRC
---
@see https://github.com/manjuraj/config/blob/master/.grc/sample.conf

```
regexp=.*(select .*)$
colours=unchanged,cyan
=====
regexp=.*(update .*)$
colours=unchanged,bold yellow
=====
regexp=.*(insert .*)$
colours=unchanged,bold yellow
=====
regexp=.*(emp=\d+).*
colours=unchanged,reverse green
=====
regexp=.*http.*/rest/contahub.cmds.(.*?)/(\w*).*$
colours=unchanged,green,magenta
=====
regexp=.*http.*/M/.*\.(.*?Facade)/(\w*).*$
colours=unchanged,underline green,underline magenta
```

grc  tail -f var/logs/dev.log      -c conf.grc

@see
https://unix.stackexchange.com/questions/8414/how-to-have-tail-f-show-colored-output

apt-get install grc
grc tail -f /var/log/apache2/error.log

CCZE
----
tail -f var/logs/dev.log | ccze -A | grep --line-buffered 'WARNING'
[//]: # tail -f -n 5 var/logs/dev.log | perl -pe 's#WARNING#\x1b[33m$&#; s#ERROR#\x1b[31m$&#; s#foo#\x1b[32m$&#' 
