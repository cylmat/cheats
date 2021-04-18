Find
----
**Find file from root**  
find / -name <file>

**Sed each .sh files**  
find . -name "*.sh" -exec sed -i 's/search/replace/' {} \;
