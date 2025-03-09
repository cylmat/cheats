VIM Samples
===========

1. Normal Mode
    - Capitalize
    - Change
    - Folding
    - Go
    - Jumps
    - Marks
    - Navigate
    - Repeat
    - Search
    - VisualMode
2. Insert Mode
3. Command Mode int
    - Settings
    - Global
    - Substitutes
    - History
    - Registers
    - Save
4. Command Mode ext
    - Buffer
    - File
    - Tabs
    - Windows Screen
    - Other
5. Common
    - Objects to "speak" vim  
    - Regexp


--------------------------------------------------------------------------------------
## 1. Normal Mode

* Capitalize

```
g~<object> : change capitalized
g~w        : change capitalized word
~          : change one char capital
gU         : lower current line
gUap       : upper all paragraph
```

* Change

```
.      : repeat last change
c<cmd> : change <cmd>
C      : change to eol
D      : delete to eol
gp, gP <=> pa, Pa (leave cursor after)
s      <=> "ch" + Insert
```

* Folding

("z" looks like a folded piece of paper)
```
zf : operator creates a fold   
zo : to unfold  
zc : closes the fold  
zM : and zR to close / open all the folds in the file  
za : toggle folds (zo/zc)
```

* Go

```
48G    : go to line 48
gi     : go last Insert place
gv     : go to last Visual selection
gn, gN : go to last search + Visual
dgn    : delete last Visual match
zt, z<Enter> (center window with cursor on top)
zz, z.       (center window on cursor)
zb, z-       (center window cursor on bottom)
48G <=> :48 - go to line 48
```

* Jumps

```
:jumps
C-o : move back on last jumps
C-i : move forward on next jumps
`[  : jump to beginning of last yanked text  
`]  : jump to end of last yanked text  
g;  : jump to the last change you made  
g,  : jump back forward through the change list
```  
  
* Marks

```
:marks
ma     : mark "a"
maB    : mark "a" and "B"
'a, `a : jumps to mark "a" (current buffer)
'A     : jumps to mark "a" (entire buffer)
y`a    : yank mark "a"
```  

* Navigate

```
^, g_    : first/last non-blank char
g0       : start of line
{, }     : next/prev paragraph
wW, bB   : next/prev word/WORD  
C-D, C-U :move down/up half page
C-B, C-F :move down/up one page
%        : match next/prev "(, {, [, ], }, )"  
3/<text>, 3?<text> : search 3rd next/prev <text> in all document 
```

* Repeat

```
.  : Repeat last change
&  : Repeat last substitution on current line  
g& : Repeat last substitution on all lines  
```

* Search

```
*, #   : search exact word 
g*, g# : search into word
K      : keyword "man" search
ga     : get unicode of current char
```

* VisualMode

```
v,V,C-v : Visual mode, Visual line, Visual block
o       : toggle the free end (start or end)
Vr-     : replace line with -
gv      : reselect last visual
C-g     : switch to Insert (like "c")
```



--------------------------------------------------------------------------------------
## 2. Insert Mode

* NormalInsert

```
C-o><cmd> (temporary normal mode)
C-o>zz (middle the screen + Insert)
```

* Register

```
C-r>0 - yank from register "0"
C-r>=<calcul> - expression register apply (ex: C-r>=6*35)
```

* Unusual

```
C-v><ord> - insert char by ord (ex: C-v>065 write 'A')
C-v><unicode> - insert unicode (C-v>u00bf write '¿')
```

--------------------------------------------------------------------------------------
## 3. Command Mode int

* Settings

```
:set wildmenu, :hlsearch, :nu  (number), :rnu (relative number)

unset options
:set rnu!, :set nornu

get option
:set expandtab? (get current "option"), :echo &expandtab (get current "variable")
:set! all (display one per line)
```

* Global

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

* Substitutes

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

* History

```
:history (or :Ctrl-f)
history -> :his /
```

* Registers

```
:reg  all registers   
:reg <register>
(4 readonly: .%:#)

:[range]action [register]
-> 1,4d a (del 1 to 4 in register a)
:.,+2y (yank from current to +2 line)

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

* Save

```
:e - reload file
:wq <file>
:wqall - Write all changed buffers and exit
:x => :wq
ZZ => :x - Write current file (if modified) and close
ZQ <=> :q! - Quit without checking change
```



--------------------------------------------------------------------------------------
## 4. Command Mode ext

* Buffer

@ref: https://vim.fandom.com/wiki/Buffers
```
:buffers
:bp, :bn, :bprev, :bnext
```

* File
```
:open <file>  
:e  
Ctrl-^, (edit alternate/previous file, like ":e #").
```

* Tabs

- https://vim.fandom.com/wiki/Using_tab_pages 
```
:tabs, :tp, :tn  
:tab(new,n,p)
:tabo(nly)
```

* Windows Screen

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

* Other

```
:ter (open a terminal inside)  
:shell (back to the shell)
:compiler, :make, :version
```

--------------------------------------------------------------------------------------
## 5. Common

* Objects to "speak" vim

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

* Regexp

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

* Vimsurround

```
d/c/y s(urround)
ds', cs'" (del or change ' to ")
```

--------------
--- VSCODE ---

```
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
```

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
