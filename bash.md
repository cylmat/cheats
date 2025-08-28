Ref
- https://github.com/onceupon/Bash-Oneliner
- https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Bourne-Shell-Builtins
- https://kapeli.com/cheat_sheets/Bash_Shortcuts.docset/Contents/Resources/Documents/index

## Shortcut

```
@see https://kapeli.com/cheat_sheets/Bash_Shortcuts.docset/Contents/Resources/Documents/index
@see https://gist.github.com/tuxfight3r/60051ac67c5f0445efee
```

### IFS (Internal Field Separator)

https://www.malekal.com/bash-ifs-utilisation-exemples

### Arithmetic operation

use $(( )) or $[ ]
```
i=$(($i%12))
echo $[a+b]
echo $((a-b))

zsh -c 'echo $((2**63))'
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

### brackets

https://www.baeldung.com/linux/bash-single-vs-double-brackets
```
type [  => [ is a shell builtin    
type [[  => [[ is a shell keyword   

[ is an alternative command for the test built-in command (POSIX)
$ [ 3 -eq 3 ] && echo “ equal”
$ test 3 -eq 3 && echo “ equal”

$ [ 3 -eq 3 -a 4 -eq 4 ] && echo “ equal”
$ [[ 3 -eq 3 && 4 -eq 4 ]] && echo “equal”

[[ is a convenient alternative to single brackets (from ksh)
$ [[ 1 < 2 ]] && echo “1 is less than 2”

for single [ Bash treated the < operator as a file redirection operator
$ [ 1 < 2 ] && echo “1 is less than 2” bash: 2: No such file or directory
use "\"
$ [ 1 \< 2 ] && echo “1 is less than 2” 1 is less than 2

group
[[ 3 -eq 3 && (2 -eq 2 && 1 -eq 1) ]]
[ 3 -eq 3 -a \( 2 -eq 2 -a 1 -eq 1 \) ] && echo

pattern only with [[ ]]
[[ $name = *c* ]] && echo
[ $name = *c* ] && echo   => ERROR

~ is regular expression
[[ $name =~ ^Alpha ]] && echo

files
[[ ! -e $filename ]] && echo
[ ! -e “$filename” ] && echo
```

### directory
current one

```
# get bash script dir
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
```

### expr

```
$(n=3; expr $n % 2) => 1

expr 15+9 => "15+9"
expr 15 + 9 => 24
```

### loop

```
for i in $(seq 1 $END); do echo $i; done
for i in $(seq 1 99); do if [ $(($i % 2)) -ne 0 ]; then echo $i; fi; done
```

### match regexp

use tilde ~
```
# sample: ABCDE-12345
re="^([^-]+)-(.*)$"
[[ "ABCDE-123456" =~ $re ]] && var1="${BASH_REMATCH[1]}" && var2="${BASH_REMATCH[2]}"
echo $var1
echo $var2
```

```
# $ ./script.sh --image-tag=5.6

if [[ "$@" =~ --image-tag=([0-9\.]+) ]]; then
   echo "Matched!"
   echo "Full match: ${BASH_REMATCH[0]}"
   echo "Captured version: ${BASH_REMATCH[1]}"
fi
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

https://manpages.ubuntu.com/manpages/bionic/fr/man4/random.4.html
```
# One random num from 0 to 9
shuf -i0-9 -n1

# /dev/random, /dev/urandom and $RANDOM
echo $(( $RANDOM % (10 - 5 + 1 ) + 5 ))
shuf -i 1-100 -n 1 (generate number)
awk -v min=5 -v max=10 'BEGIN{srand(); print int(min+rand()*(max-min+1))}'

python -c "import random; print(random.randint(5,10))"
head -20 /dev/urandom | cksum | cut -f1 -d " "

# sequence
seq -s "-" 1 2 10
echo {A..C}-5  => A-5 B-5 C-5
```

### read

```
INPUT = "5\n2"
RET=$(read -d '' x; echo "$x" | tr "\n" ' ')
read -r x y <<<$(echo $"$RET")

or

read a
read b
echo $[a+b]
echo $((a-b))
```

```
# Read input and remove carriage return ?(chatgpt)
read input
input="${input//$'\r'/}"
echo "$input"
```

### Return when sourced or bashed script

```
[[ "${BASH_SOURCE[0]}" != "${0}" ]] && echo "source" || echo "bash"
```

### test

```
$ [ -f /etc/groupe ] && echo 'y' || echo 'n
$ test -f /etc/group && echo 'y' || echo 'n
$ echo $?
$ [ -w /etc/group ] (write rights)
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

```
_f() {
  tmpfile=$(mktemp /tmp/function.req.XXXXXX)
  trap 'rm -f "$tmpfile"' EXIT
  echo "$@" > "$tmpfile"
  my_command --prompt-from-file "$tmpfile"
}
alias f=_f
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
