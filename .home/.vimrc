" ~/.vimrc

" Reset to vim-defaults, ward off unexpected things 
if &compatible
  set nocompatible 
endif

" Enable syntax highlighting
if has('syntax')
  syntax on
endif

"------------------------------------------------------------
" Options
"--------
" Display the cursor position
set ruler

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Display line numbers on the left
set number

" Show partial commands in the last line of the screen
set showcmd

" Use visual bell instead of beeping when doing something wrong
set visualbell

" Better command-line completion
set wildmenu

"------------------------------------------------------------
" Useful mappings
"----------------

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

""""""""""""""""
"    VSCODE    "
" on Windows C:\...home\.vimrc
""""""""""""""""

" Leader to <Space>
noremap <Space> <Nop>
map <Space> <Leader>
" --- or let mapleader="\<Space>"

" Editing
nnoremap <Leader>r <C-r>

" Numbers 
nnoremap <Leader>a <C-a>
nnoremap <Leader>x <C-x>

" Visual
nnoremap <Leader>v <C-v>

" Windows
nnoremap <Leader>w <C-w>

" Sneak plugin
" nmap s <Plug>Sneak_s
" nmap S <Plug>Sneak_S
" map f <Plug>Sneak_s
" map F <Plug>Sneak_S

""""""""""""
" -vscode- "
""""""""""""

"-------
" @ref:
" - https://vim.fandom.com/wiki/Example_vimrc
" - https://github.com/wellbredgrapefruit/vim_config
