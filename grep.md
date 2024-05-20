### GREP IN FILES

```
#   -li(n)e -(w)ord -(r)ecursive -r(e)gexp
* grep -nwr 'dossier' -e 'expression'  

# Recherche uniquement dans les fichiers .php
grep --include=*.php -rnw 'dossier de recherche' -e 'expression à rechercher' --exclude-dir=/etc
```
