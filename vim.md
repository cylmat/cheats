VIM SHEETS
==========

### BUFFER
https://vim.fandom.com/wiki/Buffers#Working_with_buffers  
:buffers  
:bp, :bn, :bprev, :bnext

### FILE
:open <file>  
:e

### SPLIT SCREEN
https://linuxhint.com/vim_split_screen/  
:help split  
:vsplit, :vsp [file], :sp [file]  
C-w <v^> or C-w hjkl  
C-w C-r (swap two windows)  
C-w n (swap with window n)  
C-w |_ (expand h)  
C-w = (reset windows sizes)  
C-w q (close split)
  
### REGISTER
:reg  all registers  
"" default register   
"5 fifth register  
". last one  
"% current file path  
": most recent command  
"# alternate file  
"= expression one  
"/ search register  
:let @5='' clear register '5'  

### TAB
https://vim.fandom.com/wiki/Using_tab_pages  
:tabs

### TERMINAL
:ter (open a terminal inside)  
:shell (back to the shell)

## @ref
* https://vimhelp.org/quickref.txt.html
* https://vim.rtorr.com/
* https://vim.fandom.com/wiki/Vim_Tips_Wiki
