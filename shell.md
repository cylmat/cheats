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
