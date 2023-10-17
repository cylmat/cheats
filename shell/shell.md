# Shell

## Tr
```
echo "Hello!" | tr "[:lower:]" "[:upper:]"
HELLO!
```

## Redirection shell
echo "Error" 1 >& 2  
error 2>/dev/null >/dev/null
error >/dev/null 2>&1

## Null
echo "Hello" >/dev/null  

## Shell
clear: Ctrl+u

## Onliner Sample
```
tail file | awk '{d=$1} sub(/.*{/,""){$0="{\"date\": \""d"\", " $0} 1' | jq -r '.date + " " + .log'
```
---
## @ref: 
- https://www.bashoneliners.com
- https://www.commandlinefu.com
