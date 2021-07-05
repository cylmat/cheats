Find
----
**Find file from root**  
find / -name <file>

**Sed each .sh files**  
find . -name "*.sh" -exec sed -i 's/search/replace/' {} \;

```
  /**
* test itération sur les fichiers logs
* find ./src -iregex '.*\.log$' -print0 | xargs -0 file
* find -iname '*.txt' -execdir ls {} \;
*
* or
*  cat `find src -maxdepth 1 -name *.php`
*
* tuer tous les process au $motif
*  ps -ax | grep "${motif}" | grep -v "grep" | awk '{print $1}'| xargs kill -9
*
* lister les infos
*  find . -type f -name "*.txt" -print | xargs ls -l -D %Y-%m-%d
*
* ls -1 ./src/*.txt | xargs -n1 basename
*
* recherche 'smile' dans chaque fichier json trouvé
*  find -maxdepth 1 -regex '.*.json' | xargs grep smile
*/
```
