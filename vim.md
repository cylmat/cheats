VIM SHEETS
==========

### BUFFER
https://vim.fandom.com/wiki/Buffers#Working_with_buffers  
:buffers  
:bp, :bn, :bprev, :bnext

### FILE
:open <file>  
:e  
  
### NAVIGATE
gg begin of file  
9gg 9th line  
G end of file
0$ begin last line  
^ g_ first last non-blank char  

fFtT find next occurence on line  
  ,; prev next search  
3/ 3? search next/prev 3d in all text
  nN next prev of search  
*#  search for current word  
{} next/prev paragraph  
 
wWbB next/prev word or WORD  
  
C-D C-U move down up half page  
% match next/prev ({[]})  
  
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

### TAB
https://vim.fandom.com/wiki/Using_tab_pages  
:tabs

### TERMINAL
:ter (open a terminal inside)  
:shell (back to the shell)
  
### TEXT
aA append/line
iI insert/line
cCMD replace under CMD
C change until end of line
oO open new line after/before
rR replace one char / until ESC
sS remove char/line and write until ESC (like cc)
xX delete under/before cursor
u C-r undo/redo

## @ref
* https://vimhelp.org/quickref.txt.html
* https://vim.rtorr.com/
* http://tnerual.eriogerg.free.fr/vimqrc.html
* https://vim.fandom.com/wiki/Vim_Tips_Wiki
