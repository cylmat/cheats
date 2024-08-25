VIM Samples
===========

Ref
---
Vi & Vim:  
https://vimhelp.org/vi_diff.txt.html#vi-differences  
https://www.shell-tips.com/linux/vi-vs-vim/#gsc.tab=0  

Motion & braquets:  
https://vimhelp.org/index.txt.html#%5B  
https://vimhelp.org/motion.txt.html  
https://vimhelp.org/map.txt.html#map-modes

Objets:  
https://vimhelp.org/motion.txt.html#WORD
https://vimhelp.org/motion.txt.html#text-objects
---

### BUFFER 

:buffers  
:bp, :bn, :bprev, :bnext

@ref: https://vim.fandom.com/wiki/Buffers

### FILE

:open <file>  
:e  
Ctrl-^, (edit alternate/previous file, like ":e #").  
  
### INSERT MODE

cCMD replace under CMD  
  
### MARKS 

:marks

Arbitrary selection of text:  
ma, mz  
y`a  

### NAVIGATE

^ g_ first last non-blank char  
3/ 3? search next/prev 3d in all text  
*#  search for current word  
{} next/prev paragraph  
 
wWbB next/prev word or WORD  
  
C-D C-U move down up half page  
% match next/prev ({[]})  


### REGISTERS 

:reg  all registers   
(4 readonly: .%:#) 

```
"" default unnamed register (d,c,s,x)  
". last one  
"0 last yank  
"5 5th delete text    
"% current file path    
": most recent command  (@: to run this command again.)    
"# alternate file  (:h alternate-file, last edited file)  
  ":e #"

"= expression one  (in INSERTMODE use <Ctrl-r>=) 
  <Ctrl-r>=system('ls') -> import "!ls" under cursor

"/ search register
  use <Ctrl-r> / to import last search into command line
  :%s/<Ctrl-r />/TERM/g (=> will display ":%s/search/TERM/g" in command line)
  (replace last "/search" terme by TERM)

:let @5='' clear register '5'   
let @+=@% ("let" write to a register, copy the current file to the clipboard) 

"0 to "9.
"0 will always have the content of the latest yank, 
and the others will have last 9 deleted text, being "1 the newest, and "9 the oldes
```

### SPLIT SCREEN

:help split  
:vsplit, :vsp [file], :sp [file]  
C-w <v^> or C-w hjkl  
C-w C-r (swap two windows)  
C-w n (swap with window n)  
C-w |_ (expand h)  
C-w = (reset windows sizes)  
C-w q (close split)  
  
@ref: https://linuxhint.com/vim_split_screen  

### Save

These are :wq <cr>, :x <cr> and ZZ

### TAB

:tabs, :tp, :tn  

@ref: https://vim.fandom.com/wiki/Using_tab_pages  
  
### SEARCH / REPLACE 

:[range]s[ubstitute]/{pattern}/{string}/[c][e][g][p][r][i][I] [count]  
:[range]s[ubstitute] [c][e][g][r][i][I] [count] :[range]&[c][e][g][r][i][I] [count]  
  
:27,75 s/this/that  -  change first occurence of "this" to "that" between line 27 and 75  
:.,$v/text/d  -  from here to end delete what doesn't contain "text"  
:.,+21g/alpha/d  -  delete every line containing "alpha" from here and next 21 lines  
  
:% s/\(.*text.*\)/\1new/g  replace all line with "text" occurence with "textnew"  

### TERMINAL 

:ter (open a terminal inside)  
:shell (back to the shell)
 
### Sample to "speak" vim 

- verbs: v(isu), c(hange), d(elete), y(ank)
- modifiers: i(nside), a(round), t(ill find), f(ind), /(search)
- text objects: w(ord), s(entence) p(aragraph) b(lock), t(ag), "({
  
* ci": change inside quote
* dty: delete until next "y"
* vap: visual around paragraph

---
**@ref**
* https://vimhelp.org/quickref.txt.html
* https://vim.rtorr.com/
* http://tnerual.eriogerg.free.fr/vimqrc.html
* https://vim.fandom.com/wiki/Vim_Tips_Wiki
* http://www.viemu.com/vi-vim-cheat-sheet.gif
* http://www.fprintf.net/vimCheatSheet.html
