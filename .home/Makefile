####################
# Only tabs allowed
# 
# Check with:
# cat -etv Makefile
####################
SHELL := /bin/bash

#######
# DEV #
#######
# https://kint-php.github.io/kint/
kint-bin:
	curl -LO https://raw.githubusercontent.com/kint-php/kint/master/build/kint.phar

#########
# LINUX #
#########
# https://github.com/Bash-it/bash-it
bash-it:
	git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it && ~/.bash_it/install.sh
# https://busybox.net/
busybox:
	apt install -y busybox

# https://starship.rs/
starship:
	sh -c "$(curl -fsSL https://starship.rs/install.sh)"
	
#######
# ZSH #
#######
# https://ohmyz.sh
zsh-omz:
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
zsh-autosuggestions:
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# https://www.zsh.org/
zsh:
	apt update && apt install -y fonts-powerline zsh

#######
# VIM #
#######
# https://github.com/VundleVim/Vundle.vim
vundle:
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# https://github.com/junegunn/vim-plug
vim-plug:
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
