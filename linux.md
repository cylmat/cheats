Linux
=====

Cat
---
**Get only first string part**  
echo "here is the string" | cut -d' ' -f 1  
echo * | head -n1 | awk '{print $1;}'  
echo * | head -n1 | sed -e 's/\s.*$//'  

Crlf
---
**Dos 2 unix**  
tr -d '\r' < input.file > output.file  
sed 's/^M$//' input.txt > output.txt  

### Shell
clear: Ctrl+u   
