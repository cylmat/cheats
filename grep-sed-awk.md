Grep
----

Sed
---
sed -E 's/pattern/new/' <<< "input string"

Awk
---
Awk
---
**Read each line of file or stdin**  
awk '{split($1,n,":");print n[1],$2,$3}' my_file  
awk '{print $1}' RS=' ' FS=: ORS=' ' <<< 'my_input'  