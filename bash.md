BASH
----
**Return when sourced or bashed script**  
echo "return" #executed from source  
return 1 2>/dev/null  
echo "exit" #executed from bash  
exit 1  

**Return when sourced or bashed script**  
[[ "${BASH_SOURCE[0]}" != "${0}" ]] && echo "source" || echo "bash"  

$@  
$#  
$_  

##Options##  
```
for i in "$@"; do
  case $i in
    --dest=*)
      DEST="${i#*=}"
    ;;
    --help)
      display_usage
      exit 0
    ;;
  esac
done
```

### Ref
* https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html
* https://github.com/dylanaraps/pure-bash-bible
* https://github.com/Idnan/bash-guide
* https://github.com/alexanderepstein/Bash-Snippets
* https://github.com/denysdovhan/bash-handbook
