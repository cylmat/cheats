BASH
----
**Return when sourced or bashed script**  
```
echo "return" #executed from source  
return 1 2>/dev/null  
echo "exit" #executed from bash  
exit 1  
```

**Return when sourced or bashed script**  
[[ "${BASH_SOURCE[0]}" != "${0}" ]] && echo "source" || echo "bash"  

$@  
$#  
$_  

## Options##  
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

**Bash substitution**
source <(sudo cat /etc/bash.bashrc)

Sample
---
```
NGINX=0; if (( $(service nginx status | grep "Active: active (running)" | wc -l) == 1 )); then NGINX=1; fi

### MySQL ###
if (( $(php -r 'error_reporting(0);$m=new mysqli("host","user","pass","db");echo($m&&$m->client_info)?1:0;') > 0 )); then
    echo -e ${GREEN}"MySQL ${MYSQL_HOST} running"${RESET};
fi

ELASTIC=0;
if (( $(curl -v --silent -X GET "host:9200/_cluster/health?pretty" --stderr - | grep "HTTP/1.1 200 OK" | wc -l) == 1 )); then ELASTIC=1; fi
```

Stderr-out
---
2>&1
ping -c 1 yhoo.dsd 2>&1
command1 1>&2 2>/dev/null

## Prompt
```
export PS1="${debian_chroot:+($debian_chroot)}\u@\h:\w\$ "
PS2=>
PS3=
PS4=+
```

ref:
* https://www.cyberciti.biz/tips/howto-linux-unix-bash-shell-setup-prompt.html

ALIAS
-----
**Wrapping arguments**  
```
alias pushing='f(){ git add . && git commit -m "$@" && git push;  unset -f f; }; f'
alias wrap_args='f(){ echo before "$@" after;  unset -f f; }; f'  
alias wrap_args='sh -c '\''echo before "$@" after'\'' _'  
alias mkcd='_mkcd(){ mkdir "$1"; cd "$1";}; _mkcd'  
```

### Ref
* https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html
* https://github.com/dylanaraps/pure-bash-bible
* https://github.com/Idnan/bash-guide
* https://github.com/alexanderepstein/Bash-Snippets
* https://github.com/denysdovhan/bash-handbook
