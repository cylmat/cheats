####################
# Only tabs allowed
# 
# Check with:
# cat -etv Makefile
####################
SHELL := /bin/bash

########
# BASH #
########
# https://github.com/Bash-it/bash-it
bash-it:
	git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it && ~/.bash_it/install.sh
# https://github.com/akinomyoga/ble.sh
blesh:
	apt update && apt install -y gawk
	git clone --recursive https://github.com/akinomyoga/ble.sh.git
	make -C ble.sh install PREFIX=~/.local
	echo 'source ~/.local/share/blesh/ble.sh' >> ~/.bashrc

#######
# DEV #
#######
# https://kint-php.github.io/kint/
kint-bin:
	curl -LO https://raw.githubusercontent.com/kint-php/kint/master/build/kint.phar
	
#########
# FONTS #
#########
powerline:
	# apt install -y fonts-powerline
	wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
	mv PowerlineSymbols.otf /usr/share/fonts/
	fc-cache -vf
	mv 10-powerline-symbols.conf /etc/fonts/conf.d/
	
#######
# GIT #
#######
# https://cdn.kernel.org/pub/software/scm/git/
# http://ftp.be.debian.org/pub/software/scm/git-core/git-manpages-2.30.0.tar.gz
git-man:
	wget -P /tmp http://ftp.be.debian.org/pub/software/scm/git-core/git-manpages-2.30.0.tar.gz
	cd /tmp
	tar -xzf git-manpages-2.30.0.tar.gz -C /usr/share/man

#########
# LINUX #
#########
# https://busybox.net/
busybox:
	apt install -y busybox

# https://starship.rs/
starship:
	sh -c "$(curl -fsSL https://starship.rs/install.sh)"
	echo 'eval "$(starship init bash)"' >> ~/.bashrc
	mkdir -p ~/.config && touch ~/.config/starship.toml
	
manpages:
	apt install -y manpages
	
# locales
locales:
	apt install -y locales locales-all
	
#######
# ZSH #
#######
# https://ohmyz.sh
zsh-omz:
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
zsh-autosuggestions:
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
zsh-syntax-highlighting:
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
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

# https://www.vimgolf.com/
vim-golf: 
	apt install -y rubygems && gem install vimgolf
