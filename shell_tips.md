**Get only first string part**  
```
echo "here is the string" | cut -d' ' -f 1  
echo * | head -n1 | awk '{print $1;}'  
echo * | head -n1 | sed -e 's/\s.*$//'  
```

## Shell
clear: Ctrl+u

## Null
echo "Hello" >/dev/null  

## Redirection shell
echo "Error" 1 >& 2  
error 2>/dev/null >/dev/null
error >/dev/null 2>&1

Stderr-out
---
2>&1
ping -c 1 yhoo.dsd 2>&1
command1 1>&2 2>/dev/null

Sample
---
```
$(service nginx status | grep "Active: active (running)" | wc -l) == 1 ));
if (( $(curl -v --silent -X GET "host:9200/_cluster/health?pretty" --stderr - | grep "HTTP/1.1 200 OK" | wc -l) == 1 )); then ELASTIC=1; fi
```

Crlf
---
**Dos 2 unix**  
tr -d '\r' < input.file > output.file  
sed 's/^M$//' input.txt > output.txt     

## Onliner Sample
```
tail file | awk '{d=$1} sub(/.*{/,""){$0="{\"date\": \""d"\", " $0} 1' | jq -r '.date + " " + .log'
```
