VIM GOLD COMMANDS ONE-PAGE CHEAT
===

## MOVEMENT & NAVIGATION

- `gg` / `G` : go to start / end of file  
- `0` / `^` / `$` : start of line / first non-blank / end of line  
- `w` / `e` / `b` : word motions  
- `%` : jump to matching bracket/parenthesis  
- `[[` / `]]` : jump to previous/next function/start-of-section  
- `` `^ `` : last insert start  
- `'.` : last change line  
- `g;` / `g,` : older / newer change  

- H / M / L : move cursor to top / middle / bottom of screen
- Ctrl-d / Ctrl-u : half page down/up
- zz : center screen on cursor
- zt / zb : top/bottom screen alignment
- f{char} / F{char} : jump to char forward/backward
- t{char} / T{char} : jump right before char


## SEARCH & REPLACE

- `/` / `?` : forward / backward search  
- `n` / `N` : repeat search forward / backward  
- `*` / `#` : search word under cursor forward / backward  
- `:%s/foo/bar/gc` : search & replace with confirmation  
- `gn` / `gN` : select next / previous search match

- \c / \C : ignore / match case
- \v : very magic regex mode
- :vimgrep /pattern/ **/*.ext | copen " search in multiple files
- :cfdo %s/old/new/gc " apply change in all matches

---

## REGISTERS & CLIPBOARD

- `"ayy` : yank line to register `a`  
- `"ap` : paste from register `a`  
- `"_d` : delete to black hole (no yank)  
- `"+y` / `"+p` : system clipboard yank / paste  

- :reg : list all registers
- :let @a='text': assign text to register a
- :put a : paste register a below cursor
- "0p : paste last yank (not delete)

---

## MACROS & REPEAT

- `qa…q` : record macro to register `a`  
- `@a` / `@@` : play macro `a` / repeat last macro  
- `.` : repeat last edit  

- q: : edit last command-line command
- q/ : edit last search

Tips
- Combine macros + marks + jump list = instant multi-file refactor
- Use `@a@@` chains for repeated transformations

---

## MARKS & JUMP LIST (summary)

- `ma–mz` : local mark  
- `mA–mZ` : global mark  
- `'a` / `` `a `` : jump to line / exact position  
- `<C-o>` / `<C-i>` : older / newer jump list  
- `:marks` : show marks  
- `:jumps` : show jump list

Workflows:
- mf / mt / mr " function / TODO / return anchor
- `f / `t / `r " precise teleport

**Special marks:**  
- `''` : previous line  
- '```` : previous exact position  
- `'.` : last change  
- `'^` : last insert exit  
- `'[` / `']` : start/end of last change  


---

## EDITING POWER MOVES

- `ciw` / `daw` : change / delete inner word  
- `di(` / `da(` : delete inside / around parentheses  
- `>` / `<` : indent / unindent visual selection  
- `gq` : reformat paragraph  
- `J` : join lines  
- `xp` : swap two characters  

Undo/Redo:
- u : undo
- <C-r> : redo
- :earlier 5m : jump to 5 min earlier
- :later 5m : jump to 5 min later

---

## UNDO & REDO

- `u` : undo  
- `<C-r>` : redo  
- `:earlier 5m` : go 5 minutes earlier  
- `:later 5m` : go 5 minutes later  

---

## WINDOWS & TABS

- `:split` / `:vsplit` : horizontal / vertical split  
- `<C-w>w` : switch window  
- `<C-w>q` : close window  
- `:tabnew` : open new tab  
- `gt` / `gT` : next / previous tab  

- <C-w T : move window to new tab
- <C-w K / H / J / L : move split to top / left / bottom / right


---

## FOLDING & OUTLINE

- `za` / `zc` / `zo` : toggle / close / open fold  
- `zR` / `zM` : open all / close all folds  
- `zf{motion}` : create fold over motion  

- zd : delete fold
- zE : eliminate all folds

Tip:
- Combine folds + marks for instant file map navigation
- zc/zo while scanning large files avoids scrolling


---

## 🔟 UNCOMMON BUT USEFUL

- `:keepjumps` : execute without affecting jump list  
- `:normal` : run normal mode command on range  
- `:global /pattern/command` : run command on all matching lines  
- `:registers` : list all registers  
- `gd` / `gD` : go to local / global declaration  
- `CTRL-G` : file info + cursor position  
- `:!command` : run shell command  

- :source % : reload current vim file
- :read !ls : insert shell output
- :tab drop file : open file in existing tab if present


## TIPS & BEST PRACTICES

- Use marks + capital marks + jump list for instant zero-scroll teleportation
- Use visual selection + `:` + normal for batch transformations:  `:'<,'>normal I// ` : add comment to selection
- Quick search + change in multiple files: `:vimgrep /pattern/ **/*.ext | cfdo %s/old/new/gc`
- Combine folds + zz / zt / zb for fast context navigation
- Macros + registers + marks + jump list = “multi-file refactor in <10s”
- Use gn / gN + . for blazing fast search-and-change
- :keepjumps when using macros to avoid polluting jump list
- Ctrl-O / Ctrl-I + backtick + marks = teleport like a wizard

- Always use backtick `` ` `` for exact positions
- Combine marks + jump list + folds = instant context jumps
- Capital marks (A–Z) = long-term anchors across files
- View marks often with :marks
- Use g; / g, to track changes in refactor workflows
- Registers + macros + visual commands = atomic, repeatable edits
- Use :registers and :normal for batch edits
- Master :vimgrep / cfdo / global for multi-file refactoring
