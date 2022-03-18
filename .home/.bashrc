# @ref
# https://gist.github.com/zachbrowne/8bc414c9f30192067831fafebd14255c

#######
# GIT #
#######
if [ ! -f ~/git-completion.bash ]; then
  wget https://github.com/git/git/blob/master/contrib/completion/git-completion.bash -O ~/git-completion.bash
]
fi
source ~/git-completion.bash

###########
# HISTORY #
###########
function historyfzf () {
  $(history | fzf | grep -oE [^0-9]+)
}
alias hf="historyfzf"
