# Fake data

generate 50 chars
```
[:graph:]   Graphical characters: '[:alnum:]' and '[:punct:]'
tr -dc '[:graph:]' < /dev/urandom | head -c 50
```
