SHELL := /bin/bash

###
# BIN
###
bash-it:
	git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it && ~/.bash_it/install.sh
	
# https://starship.rs/
starship:
	sh -c "$(curl -fsSL https://starship.rs/install.sh)"

# https://kint-php.github.io/kint/
kint-bin:
	curl -LO https://raw.githubusercontent.com/kint-php/kint/master/build/kint.phar

###
# VIM
###
# https://github.com/VundleVim/Vundle.vim
vundle:
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# https://github.com/junegunn/vim-plug
vim-plug:
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
