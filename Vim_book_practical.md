# Practical Vim
Drew Neil

Vimcasts.org
Tips: use dot, dont repeat yslf, make changes repeatable, repeat substit with '&'

. Repeat
* search
>G indent until eof
s=cl, S=^C, I=^i
gugu or guu : lower all line
gc or gcc : comment
= autoindent
[
zz : draw the screen on middle
K : look man page
gr,gR : virtual replace mode
c : change selection
C-D, C-U : up, down
3G go line 3
(gcae comment file)
omap option : custom map
:set shiftwidth=4 softtabstop=4 expandtab​
Tabstop
Tips : remape Capslock to Esc or Ctrl

Insert mode ____
Select mode: visual then 'A'

13 correct in insert
C-hwu> : delete back

14 get back to normal
C-[> like Esc
C-o> : switch to InsertNormal (fire one normal command then back to Insert)
C-o>zz : middle the screen then Insert

15 past from register
C-r>0 : yank from register 0 by char
C-r>C-p>0 : yank all line from 0

16 expression
C-r>= : expression register then CR> to apply (C-r>6*35CR>)

17 unusual char
C-v> : char by ord (C-v>065 donne 'A')
C-v>u00bf as unicode
C-v>nondigit (ex Tab)
C-k>char1char2 with :digraph
ga : get unicode char of current word

18 replace mode
gr,gR replace in virtual mode (tab as space)

Visual___ v,V,C-v
gv : reselect last visual
o : toggle the free end
Vr- : replace line with -
C-g : toggle select mode (typing switch to insert mode)

Command__ 
27 (normal on current, cmd on long range)
C-w or C-u delete to start word/line
C-v or C-k insert unusual char

28 use range
:1,20delete x : range to register x
:1,20yank x
:20put x : line to reg x

29 duplicate or move
:1,20copy <addr> (:1,10t0) 'co' or 't'
(:t. eq to yyp)
:6G yy C-o p => :6t.
:1,20move <addr> (:m)
(visu dGp equi to :m$)
:1,20join

30 Execute normal command 
:1,20normal <command> (e.g. '.')
:%normal A;
:%normal i//
:1,20substitute/pattern/string/flag
:1,20global/pattern/<command>
:edit,write,tabnew,split,prev,next,bp(rev),bn(ext),c(opy)next,tnext

:p or :print line in command
:$ end of file
:3p go line3 then print
(3G-dd => :3d)
:.,$ current line to eofile
:%y all lines yanked (equiv :1,$y)

Visualselection: e.g. 2G-VG then ':'
:'<,'> from to visual selection
:pattern,pattern (:<html+1,\/html>-1y)
:.,.+3 current to plus3
:'m (to mark)
C-o reverse last command
u : undo

31 last
@: repeat last ex cmd

32 autocomplete
C-d or Tab : reveal autocompletion
:tab,set,help

:command-complete
:wildmode=longest,list (bashlike)
:wildmode :wildmode=full (zsh)

Navigate with Tab, C-n, C-p, left, right

33 insert current word at prompt
C-rC-w copy current word to prompt
:* then cw <newtype>
:%s//C-rC-w/g

