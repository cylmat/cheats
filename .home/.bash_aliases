
# @ref
# https://www.cyberciti.biz/tips/bash-aliases-mac-centos-linux-unix.html

######
# LS #
######
export LS_OPTIONS='--color=auto'
eval "`dircolors`"
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'

# Wrapping arguments #
# alias pushing='f(){ git add . && git commit -m "$@" && git push;  unset -f f; }; f'
# alias wrap_args='f(){ echo before "$@" after;  unset -f f; }; f'  
# alias wrap_args='sh -c '\''echo before "$@" after'\'' _'  
# alias mkcd='_mkcd(){ mkdir "$1"; cd "$1";}; _mkcd'  

# COLORS #
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'

# COMMANDS #
alias ..='cd ..'
alias .bashrc="vim ~/.bashrc"
alias c="clear"
alias dfh='df -h'
alias home='cd ~'
