VIM Samples
===========

**********
* BUFFER *
**********
:buffers  
:bp, :bn, :bprev, :bnext

@ref: https://vim.fandom.com/wiki/Buffers

********
* FILE *
********
:open <file>  
:e  
  
***************
* INSERT MODE *
***************
cCMD replace under CMD  
  
*********
* MARKS *
*********
:marks

Arbitrary selection of text:  
ma, mz  
y`a  
  
************
* NAVIGATE *
************
^ g_ first last non-blank char  
3/ 3? search next/prev 3d in all text  
*#  search for current word  
{} next/prev paragraph  
 
wWbB next/prev word or WORD  
  
C-D C-U move down up half page  
% match next/prev ({[]})  

************
* REGISTER *
************
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

****************
* SPLIT SCREEN *
****************
:help split  
:vsplit, :vsp [file], :sp [file]  
C-w <v^> or C-w hjkl  
C-w C-r (swap two windows)  
C-w n (swap with window n)  
C-w |_ (expand h)  
C-w = (reset windows sizes)  
C-w q (close split)  
  
@ref: https://linuxhint.com/vim_split_screen  

*******
* TAB *
*******
:tabs, :tp, :tn  

@ref: https://vim.fandom.com/wiki/Using_tab_pages  
  
**********
* SEARCH *
**********
:[range]s[ubstitute]/{pattern}/{string}/[c][e][g][p][r][i][I] [count]  
:[range]s[ubstitute] [c][e][g][r][i][I] [count] :[range]&[c][e][g][r][i][I] [count]  
  
:27,75 s/this/that  -  change first occurence of "this" to "that" between line 27 and 75  
:.,$v/text/d  -  from here to end delete what doesn't contain "text"  
:.,+21g/alpha/d  -  delete every line containing "alpha" from here and next 21 lines  

************
* TERMINAL *
************
:ter (open a terminal inside)  
:shell (back to the shell)
 
*************************
* Sample to "speak" vim *
*************************
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
