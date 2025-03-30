VIM Samples
===========

1. Normal Mode
    - Capitalize
    - Change
    - Folding
    - Center
    - Jumps
    - Marks
    - Navigate
    - Repeat
    - Search
    - VisualMode
2. Insert Mode
3. Command Mode int
    - Settings
    - Prompt
    - Range
    - Substitutes
    - Global
    - History
    - Registers
    - Save
    - Specific
4. Command Mode ext
    - Buffer
    - File
    - Tabs
    - Shell
    - Windows Screen
    - Other
5. Common
    - Vim command
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

* Center

```
zt, z<Enter> (center window with cursor on top)
zz, z.       (center window on cursor)
zb, z-       (center window cursor on bottom)
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
gg       : go to line 0
G        : go to eof
48G      : go to line 48 <=> :48
^, g_    : first/last non-blank char
0, g0    : start of line
gi       : go last Insert place
gv       : go to last Visual selection
gn, gN   : go to last search + Visual
dgn      : delete last Visual match
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
C-o><cmd> - temporary normal mode
C-o>zz    - middle the screen + Insert
```

* Register

```
C-r>0                   - yank from register "0
C-r>=<calcul>           - expression register apply (ex: C-r>=6*35)
C-r>=system('ls <dir>') - import "!ls <dir>" under cursor
```

* Unusual

```
C-v><ord>     - insert char by ord (ex: C-v>065 write 'A')
C-v><unicode> - insert unicode (C-v>u00bf write '¿')
```

```
:r {file} : Insert <file> content
```

--------------------------------------------------------------------------------------
## 3. Command Mode int

* Settings

```
:set wildmenu, :hlsearch, :nu (number), :rnu (relative number)
# Navigate menu with Tab, C-n, C-p

# unset options
:set rnu!, :set nornu

# get option
:set expandtab?          (get current "option")
:echo &expandtab         (get current "variable")
:verbose set expandtab?
:echo &l:expandtab
:echo g:colors_name
:set! all                (display one per line)

# useful
:set spell               (syntax check)
:setlocal spell spelllang=fr
:vert diffsplit fichier2 (open diff vertical)

---
.vimrc
set history=200
set diffopt=vertical     (open "diff" vetical by default)
```

* Map

```
sample:
# Map-normal F2 key to `uuidgen`, trim `\n` and put in register `"=`
nmap <F2> "= system("uuidgen")[:-2]<C-M>P
```

* Prompt
```
:C-r>/    - import last search term into command line
:C-r>C-w> - Copy current word to prompt
:s/text/<C-r><C-w>/g
```

* Range

```
:1,20d(elete) x    - del range into register x
:1,20y(ank) x
:20put x           - line from reg x
:.-2,.2y i         - copy cursor-2,cursor+2 to reg i
:.,.+3y            - yank from current to +3
:1,20co(py) <addr> - <=> :1,20t<addr> (:1,20t4)
:t. <=> yyp
:6t.               - :6Gyy, then back current line, then C-o>p (is shorter)
:3d <=> 3Gdd
:1,20mo(ve) <addr> or :9m4
:m$                - <=> dGp (move current line to end of file)
:1,20join
:'<,'>t0           - ('< and '>) copy last Visual to start of file
```

* Substitutes

```
- s/pattern/text   substitute first occurence  
- s/pattern/text/g substitute all occurences on line
- g/pattern/text   execute command on all lines

:[range]s[ubstitute]/{pattern}/{string}/[c][e][g][p][r][i][I] [count]  
:[range]s[ubstitute] [c][e][g][r][i][I] [count] :[range]&[c][e][g][r][i][I] [count]  

:27,75s/this/that        - change first occurence of "this" to "that" between line 27 and 75  
:%s/\(.*text.*\)/\1new/g - replace all line with "text" occurence with "textnew"
:%s/foo/bar/gc           - ask to manually confirm (`c` flag) each replacement

Magic (smagic and snomagic)
:%sno/regex/new_text/g

Flags (:h s_flags)
:s/pattern/replace/FLAG
c - ask for confirmation before each replacement
g - replace all occurrences within a matching line
i - ignore case for searchpattern (disable ignorecase' and 'smartcase')
I - don't ignore case for searchpattern
n - report the number of matches
p - print the substitutes lines
# - (p) and prepend line number
l - (p) print text like list
```

* Global

https://vim.fandom.com/wiki/Power_of_g
```
Pattern
:g <=> :1,$g or :%g  - 1,$ or % is ALL by default
:g/pattern/<cmd>     - Execute command on all lines
:g/NOTE/m$           - Mmove all line containing NOTE to eof
:.,+21g/alpha/d      - from here and next 21 lines, delete every line containing "alpha"  
:g/^\s*$/d           - Delete all blank lines
:g/\d/echo line('.') - Echo all lines that contain a digit
:g/^/pu =\"\n\"      - Space after all lines
:g/console/g/two/d   - Find "console", then "two" inside it, then delete
:5,18g/^foo/s/^.\{-}=/

Caution
:g/FOO/d _   ("_" in the "d _" command ensures registers and clipboards are not changed)

Macro
:g/^fu.*().{$/normal! @e (exec macro "e" on each "function(){..." )

Normal mode
:g/alf/norm gUU             - Uppercase lines where "alf" is present
:g/^#/norm 0x               - Decrease the depth of markdown title
:.,$g/Lesson/exe "norm! A;" - add ; to end of line containing "Lesson" from line to eof

Register ("e replace, "E append in e)
:g/^#/y A      - Append comment in "a" register

Change delimiters
:g@console@d
:g@one@s+const+let+g (use global and sub)    

Do NOT match grep
:g!/pattern/d   – Remove lines that do NOT match the pattern
:g!/;$/norm A;  - Add ; only if not find 
:v/^.*DWN.*/d   – Remove lines that do NOT match ^..DWN..$
:.,$v/text/d    - from current line to end, delete what doesn't contain "text" 
```

* History

```
:history (or :Ctrl-f)
history -> :his /

(use clipboard to copy/paste)
```

* Registers

https://vimhelp.org/change.txt.html#registers
```
1. The unnamed register ""
2. 10 numbered registers "0 to "9
3. The small delete register "-
4. 26 named registers "a to "z or "A to "Z
5. Three read-only registers ":, "., "%
6. Alternate buffer register "#
7. The expression register "=
8. The selection and drop registers "*, "+ and "~ 
9. The black hole register "_
10. Last search pattern register "/
```

```
:reg - all registers   
:reg <register>

:[range]action [register]
:1,4d a (del 1 to 4 in register a)
:.,+2y (yank from current to +2 line)

Blackhole
"_     (ex: "_2yy) 

Types
"" default unnamed register (with commands d,c,s,x)  
"0 to "9
"0      - the latest yank 
"0..."9 - last 9 deleted text, with "1 the latest

Readonly : 4 registers are readonly
". last inserted text   
"% current file path  
": most recent command (@: to run this command again.)
"# alternate file      (last edited file)  
:e "#  -> Edit last opened file

Expression
"= expression one   - in InsertMode use <Ctrl-r>= 
<C-r =>system('ls') - import "!ls" under cursor

Search
"/ search register
:C-r>/ (import last search term into command line)
:%s/<Ctrl-r />/TERM/g (=> will display ":%s/search/TERM/g" in command line)

Clear
:let @5='' - clear register '5'   
:let @+=@% - "let" write to a register, copy the current file to the clipboard
:let @a=@_ - clearing register "a
```

* Save

```
:e            - reload file
:e <file>     - open <file>
:split <file>
:wq <file>
:wqall        - Write all changed buffers and exit
:x <=> :wq
ZZ <=> :x     - Write current file (if modified) and close
ZQ <=> :q!    - Quit without checking change
```

* Specific

```
%  is current filename
@: repeat last command
q: open history
q/ cmdline search
```



--------------------------------------------------------------------------------------
## 4. Command Mode ext

* Buffer

@ref: https://vim.fandom.com/wiki/Buffers
```
:buffers or :ls
:bf(irst), :bp(rev), :bn(ext), :bl(ast)
:b 2          - open buffer #2
: bd 2        - delete buffer #2
:n(ew), :vnew - open new buffer (or split)

:read <cmd>   - :r, place cmd in buffer (ex :read !ls)
:read <file>  - place content in current file
:write <cmd>  - :w, put in buffer
:write !sh    - send buffer to shell
:write! sh    - careful: override "sh" file
:write | !ruby %
:1,4write !sh - send lines 1 to 4 to shell

:wall (write all)
:ball (open a window for all buffers)
:bunload (removes buffer from window)
:taball (open a tab for all buffers)
```

* File
```
:open <file>  
:e  
Ctrl-^, (edit alternate/previous file, like :e #).
```

* Tabs

- https://vim.fandom.com/wiki/Using_tab_pages 
```
:tabs, :tp, :tn  
:tab(new,n,p)
:tabo(nly)
```

* Shell

```
:!<cmd> - Run shell cmd
:!ls    - (not :ls)
:shell
:write | !ruby %
:1,4write !sh - send lines 1 to 4 to shell
:5,16!sort -t',' -k2 (filter range on key2)

# Sort visual range on column 1 as a number
:'<,'>!sort -gk 1

# Open file in hexadecimal
vim -b(inary) (or :set binary) then :%!xxd
:%!xxd -r to back to normal mode

# Exemple command with jq:
{
   "_id": "67e6c8",
   "age": 40,
   "balance": "$3.58"
}
:1,5!jq '{ref: ._id, account: "\(.balance) \(.age)"}'
```

* Windows Screen

- https://linuxhint.com/vim_split_screen
```
:help split  
:vsplit, :vsp [file], :sp [file]  
C-w>s or C-w>v <=> :sp or :vsp
C-w <v^> or C-w hjkl  
C-w> C-r>     - swap two windows
C-w> n        - swap with window n  
C-w> C-w>     - move cursor to another window (cycle)
20<C-w>-/+    - expand/decrease 20size height (- or +)
30<C-w></>    - decrease/expand 30size width (< or >)
50<C-w>_      - Set height as 50% (C-w>_ <=> max height)
70<C-w>|      - Set width as 70% (C-w>| <=> max widh)
C-w>=         - reset windows sizes
C-w>q         - close split 
:hide (hide current)
:sview <readonlyfile>
:only (keep only current)

# split
:vert file1 fichier2
(ajouter  dans .vimrc pour être par defaut)
set diffopt=vertical
```

* Other

```
:ter   - open a terminal inside  
:shell - back to the shell
:source batch.vim (run all cmds)

:call, :compiler, :make, :version

vim *.html - open every files in args
:args      - show "vim" command arguments
```

--------------------------------------------------------------------------------------
## 5. Common

* Vim command

```
$ vim -b(inary mode) -l(isp mode) -e(x mode) -v(i mode)
$ vim -D(ebug mode) -R(eadonly view) -m(odif not allowed)
$ vim -L : list temporary ".swap" files

$ vim -c <cmd>    (run command)
$ vim -n(o swap file, memory only)
$ vim --clean     (nocompatible, no plugins)
$ vim --cmd <cmd> (loaded before vimrc)
$ view            (vim in ReadOnly mode)
$ vimdiff         <=> vim -d

```

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

* Vim

```
vim +line_number <file> (Open file at a specified line)
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
help
* https://vimhelp.org/quickref.txt.html
* https://vim.rtorr.com
* http://tnerual.eriogerg.free.fr/vimqrc.html
* https://vim.fandom.com/wiki/Vim_Tips_Wiki
* http://www.viemu.com/vi-vim-cheat-sheet.gif
* http://www.fprintf.net/vimCheatSheet.html
Tutos:
- https://learnbyexample.github.io
- https://learnvim.irian.to
- https://vimtricks.com
Motion & braquets:  
- https://vimhelp.org/index.txt.html#%5B  
- https://vimhelp.org/motion.txt.html  
- https://vimhelp.org/map.txt.html#map-modes
see also: 
- https://vimhelp.org/vi_diff.txt.html#vi-differences
- https://www.shell-tips.com/linux/vi-vs-vim/#gsc.tab=0 
