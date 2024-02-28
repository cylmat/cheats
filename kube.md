k get pod
k get deploy
k logs svc/api-symfony

alias kdep='f(){k get pod | grep "$@" ; unset -f f}; f' 
