VIM Samples
===========

1. Normal Mode
  a. Folding
  b. Jumps
  c. Marks
  d. Navigate
  e. Repeat
2. Insert Mode
3. Command Mode
  a. Settings
  b. Buffer
  c. File
  d. Global
  e. History
  f. Registers
  g. Save
  h. Substitutes
  i. Tabs
  j. Windows Screen
  k. Other
4. Common
  a. Objects to "speak" vim  
  b. Regexp


---------------------------------------------------
## 1. Normal Mode

```
g~ change capitalized
gv (go to last visual selection)

C change to eol
D delete to eol
X delete char before
s => ch + Insert
~ change one char capital
K keyword search

gi: go last Insert place
.: repeat last change
gn, gN apply change to next search match
gp, gP like p,P and put cursor after
:reg <register>
:x => wq
:wqall
:[range]action [register]
-> 1,4d a (del 1 to 4 in register a)
:.,+2y (yank from current to +2 line)
```

a. Folding
```
(z looks like a folded piece of paper)  

zf operator creates a fold   
zo to unfold  
zc closes the fold  
There is also zM and zR to close / open all the folds in the file  
za toggle folds (zo/zc)
```

b. Jumps
```
`[ Jump to beginning of last yanked text  
`] Jump to end of last yanked text  
g; Jump to the last change you made  
g, Jump back forward through the change list
```  
  
c. Marks
```
:marks
ma, mz  
y`a
```  

d. Navigate
```
^ g_ first last non-blank char  
3/ 3? search next/prev 3d in all text  
*#  search for current word  
{} next/prev paragraph  
 
wWbB next/prev word or WORD  
  
C-D C-U move down up half page  
% match next/prev ({[]})  
```

e. Repeat
```
. Repeat last change
& Repeat last substitution on current line  
g& Repeat last substitution on all lines  
```



---------------------------------------------------
## 2. Insert Mode

```
c<CMD> replace under CMD  
Insert: C-o (temporary normal mode)
```



---------------------------------------------------
## 3. Command Mode

a. Settings
```
:set wildmenu, :hlsearch, :nu  (number), :rnu (relative number)

unset options
:set rnu!, :set nornu
```

b. Buffer
@ref: https://vim.fandom.com/wiki/Buffers
```
:buffers
:bp, :bn, :bprev, :bnext
```

c. File
```
:open <file>  
:e  
Ctrl-^, (edit alternate/previous file, like ":e #").
```

d. Global
https://vim.fandom.com/wiki/Power_of_g
```
(ex :g/alf/norm gUU -> uppercase lines where "alf" is present)  
(ex: :g/console/g/two/d -> find "console", then "two" inside it, then delete)  

change delimiters, :g@console@d
g@one@s+const+let+g (use global and sub)    

:g => :1,$g or :%g
:g/^#/y A (append comment in "a" register)
(Register "e replace, "E append in e)
:g!/;$/norm A; (add ; only if not find)
:g/^#/norm 0x (decrease the depth of markdown title)

:g/pattern/<cmd> execute command on all lines
:g/NOTE/m$ (move all line containing NOTE to eof)
:g/^\s*$/d (Delete all blank lines)
:g/\d/echo line('.')    (echo all lines that contain a digit)
:g/^/pu =\"\n\" (space after all lines)
:.,$g/Lesson/exe "norm! A;" (add ; to end of line containing "Lesson" from line to eof)

(effect of these two command ?)
qaq:g/pattern/y A (Copy all lines matching a pattern to register 'a'.)
:5,18g/^foo/s/^.\{-}=/

(do NOT match grep)
:g!/pattern/d – Remove lines that do NOT match the pattern.
:v/^.*DWN.*/d – Remove lines that do NOT match ^..DWN..$
```

e. History
```
:history (or :Ctrl-f)
history -> :his /
```

f. Registers 
```
:reg  all registers   
(4 readonly: .%:#) 

"" default unnamed register (d,c,s,x)  
". last inserted text
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
:let @a=@_ (clearing register "a)

"0 to "9.
"0 will always have the content of the latest yank, 
and the others will have last 9 deleted text, being "1 the newest, and "9 the oldes
```

g. Save
```
:wq <cr>, :x <cr> and ZZ
```
  
h. Substitutes
```
- s/pattern/text   substitute first occurence  
- s/pattern/text/g substitute all occurences on line
- g/pattern/text   execute command on all lines
```

```
:[range]s[ubstitute]/{pattern}/{string}/[c][e][g][p][r][i][I] [count]  
:[range]s[ubstitute] [c][e][g][r][i][I] [count] :[range]&[c][e][g][r][i][I] [count]  
  
:27,75 s/this/that  -  change first occurence of "this" to "that" between line 27 and 75  
:.,$v/text/d  -  from here to end delete what doesn't contain "text"  
:.,+21g/alpha/d  -  delete every line containing "alpha" from here and next 21 lines  
  
:% s/\(.*text.*\)/\1new/g  replace all line with "text" occurence with "textnew"  
```

i. Tabs
- https://vim.fandom.com/wiki/Using_tab_pages 
```
:tabs, :tp, :tn  
:tab(new,n,p)
:tabo(nly)
```

j. Windows Screen
- https://linuxhint.com/vim_split_screen
```
:help split  
:vsplit, :vsp [file], :sp [file]  
C-w <v^> or C-w hjkl  
C-w C-r (swap two windows)  
C-w n (swap with window n)  
C-w |_ (expand h)  
C-w = (reset windows sizes)  
C-w q (close split)  

C-w>s or C-w>v => :sp or :vsp
```

k. Other
```
:ter (open a terminal inside)  
:shell (back to the shell)
```

---------------------------------------------------
## 1. Common

a. Objects to "speak" vim  
(https://vimhelp.org/motion.txt.html#text-objects)  
```
- verbs: v(isu), c(hange), d(elete), y(ank)
- modifiers: i(nside), a(round), t(ill find), f(ind), /(search)
- text objects: w(ord), s(entence) p(aragraph) b(lock), t(ag), "({
  
* ci": change inside quote
* dty: delete until next "y"
* vap: visual around paragraph

w word
s sentence
b,(,) block inside ()
B,{,} block inside {}
<,>
[,]
t tag
```

b. Regexp
https://vimregex.com
```
:h s_flags  (help flags)
- c (confirm each)
- g (all line occurences)
- i (ignore case)
- I (don't ignore case)
- n (report number of matches)
- p/#/l (print line substitued, number, text)
```


---------------
--- PLUGINS ---


### Vimsurround

d/c/y s(urround)
ds', cs'" (del or change ' to ")

--------------
--- VSCODE ---


Vim.leader: <Space>
Leader>f/b
Leader>t+t/n/p/o (tab new,n,p,only)
"before":[]... "commands":[:tabn]...
(Sample cmd: workbench.action.files.save) (from Open Keyboard Shortcut)

C-S-p command
C-p file
C-S-o symbol in file
C-t symbol in workspace

Multiple cursor go in VisualMode
On a word type C-d, C-d... (or gb)
Search with /, then gb, gb...

Multiline: use Visual blocks with C-V
then I or A to multitype

Repeat : .change ,;nN/?search @@:@ex

:Execute (is like :norm but evaluate special chars)
:exe(cute) "%normal wcit<a href=\"\">\<ESC>pa</a>\<ES\ 2 C>"
:$put a (put reg "a" at end of file)

VsCodeVim Module:
- af Visual mode block
- gh Hovering the mouse
 
---
**@ref**
Motion & braquets:  
- https://vimhelp.org/index.txt.html#%5B  
- https://vimhelp.org/motion.txt.html  
- https://vimhelp.org/map.txt.html#map-modes
help
* https://vimhelp.org/quickref.txt.html
* https://vim.rtorr.com
* http://tnerual.eriogerg.free.fr/vimqrc.html
* https://vim.fandom.com/wiki/Vim_Tips_Wiki
* http://www.viemu.com/vi-vim-cheat-sheet.gif
* http://www.fprintf.net/vimCheatSheet.html
Tutos:  
- https://learnvim.irian.to
- https://vimtricks.com
see also: 
- https://vimhelp.org/vi_diff.txt.html#vi-differences
- https://www.shell-tips.com/linux/vi-vs-vim/#gsc.tab=0 
