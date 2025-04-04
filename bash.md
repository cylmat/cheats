Ref
- https://github.com/onceupon/Bash-Oneliner
- https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Bourne-Shell-Builtins
- https://kapeli.com/cheat_sheets/Bash_Shortcuts.docset/Contents/Resources/Documents/index

## Shortcut

```
@see https://kapeli.com/cheat_sheets/Bash_Shortcuts.docset/Contents/Resources/Documents/index
@see https://gist.github.com/tuxfight3r/60051ac67c5f0445efee
```

### Arithmetic operation

use $(()) ex: 
```
i=$(($i%12))
```

### Array

```
# create array 
ARR=("a" "b" "c")
echo "${ARR[1]}"

# array value
for str in ${ARR[@]}; do
  echo $str
done

# array indice
for i in ${!myArray[@]}; do
  echo "element $i is ${myArray[$i]}"
done
```

### Options

longoptions with getopt
- https://www.baeldung.com/linux/bash-parse-command-line-arguments
```
VALID_ARGS=$(getopt -o abg:d: --long alpha,beta,gamma:,delta: -- "$@")

# if last command return is not zero, exit with error
if [[ $? -ne 0 ]]; then
    exit 1;
fi

eval set -- "$VALID_ARGS"
while [ : ]; do
  case "$1" in
    -a | --alpha)
        echo "Processing 'alpha' option"; shift
        ;;
    -b | --beta)
        echo "Processing 'beta' option"; shift
        ;;
    -g | --gamma)
        echo "Processing 'gamma' option. Input argument is '$2'"; shift 2
        ;;
    -d | --delta)
        echo "Processing 'delta' option. Input argument is '$2'"; shift 2
        ;;
    --) shift; 
        break 
        ;;
  esac
done
```

getopts (only short options)
```

while getopts ":hn:" option; do
    case $option in
            h) # display Help
                echo "options"
                exit;;
            n) # Enter a name
                echo "555: options $OPTARG"
                Name=$OPTARG;;
            \?) # Invalid option
                echo "Error: Invalid option"
                exit;;
            :) # Missing argument
                echo "Option -$OPTARG requires an argument." >&2
                exit 1;;
            *)  # If unknown (any other) option:
                exit_abnormal;;
    esac
done


for opt in "$@"; do case $opt in
    --test=*) echo ""
esac; done
```

manually
```
opt="$@"
if [[ -z "$opt" ]]; then
  display_usage
fi

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

### Random

One random num from 0 to 9
```
shuf -i0-9 -n1
echo $(($RANDOM%(20-10+1)+10))
```

### Return when sourced or bashed script

```
[[ "${BASH_SOURCE[0]}" != "${0}" ]] && echo "source" || echo "bash"
```

### Variables

@https://www.epons.org/shell-bash-variables.php
```
$$   PID du shell courant 
$!   PID du dernier travail lancé en arrière plan 
$?   code retour de la dernière commande
$0   nom du script 
$1 $2 ... ${10}   paramètres positionnels (1, 2 et 10) 
$#   nombre de paramètres positionnels 
$*   ou $@   ensemble des paramètres positionnels, équivalant à $1 $2 ... ${n} 
"$*" ensemble des paramètres positionnels, équivalant à "$1 $2 ... ${n}" 
"$@" ensemble des paramètres positionnels, équivalant à "$1" "$2" ... "${n}"
$var ou ${var}  contenu de la variable 
"var" ${#var}   longueur de la variable "var"    
$_   equivalent to argv[0]
```

- ps --pid $$ -oargs= (display current shell name, -zsh)

### Wrapping arguments
```
alias pushing='f(){ git add . && git commit -m "$@" && git push;  unset -f f; }; f'
alias wrap_args='f(){ echo before "$@" after;  unset -f f; }; f'  
alias wrap_args='sh -c '\''echo before "$@" after'\'' _'  
alias mkcd='_mkcd(){ mkdir "$1"; cd "$1";}; _mkcd'
```

**Bash substitution**
source <(sudo cat /etc/bash.bashrc)

## Prompt
```
export PS1="${debian_chroot:+($debian_chroot)}\u@\h:\w\$ "
PS2=>
PS3=
PS4=+
```

## Tr
```
echo "Hello!" | tr "[:lower:]" "[:upper:]"
HELLO!
```

---
## @ref: 
- https://www.bashoneliners.com
- https://www.commandlinefu.com
* https://www.cyberciti.biz/tips/howto-linux-unix-bash-shell-setup-prompt.html
* https://www.epons.org/shell-bash-variables.php  

### Ref
* https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html
* https://github.com/dylanaraps/pure-bash-bible
* https://github.com/Idnan/bash-guide
* https://github.com/alexanderepstein/Bash-Snippets
* https://github.com/denysdovhan/bash-handbook
