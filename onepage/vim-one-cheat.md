# ===============================
VIM GOLD + UNDERRATED COMMANDS — 1-PAGE CHEAT
# ===============================

## 1️⃣ MOVEMENT & NAVIGATION

- `gg` / `G` : go to start / end of file  
- `0` / `^` / `$` : start of line / first non-blank / end of line  
- `w` / `e` / `b` : word motions  
- `%` : jump to matching bracket/parenthesis  
- `[[` / `]]` : jump to previous/next function/start-of-section  
- `` `^ `` : last insert start  
- `'.` : last change line  
- `g;` / `g,` : older / newer change  

---

## 2️⃣ SEARCH & REPLACE

- `/` / `?` : forward / backward search  
- `n` / `N` : repeat search forward / backward  
- `*` / `#` : search word under cursor forward / backward  
- `:%s/foo/bar/gc` : search & replace with confirmation  
- `gn` / `gN` : select next / previous search match  

---

## 3️⃣ REGISTERS & CLIPBOARD

- `"ayy` : yank line to register `a`  
- `"ap` : paste from register `a`  
- `"_d` : delete to black hole (no yank)  
- `"+y` / `"+p` : system clipboard yank / paste  

---

## 4️⃣ MACROS & REPEAT

- `qa…q` : record macro to register `a`  
- `@a` / `@@` : play macro `a` / repeat last macro  
- `.` : repeat last edit  

---

## 5️⃣ MARKS & JUMP LIST (summary)

- `ma–mz` : local mark  
- `mA–mZ` : global mark  
- `'a` / `` `a `` : jump to line / exact position  
- `<C-o>` / `<C-i>` : older / newer jump list  
- `:marks` : show marks  
- `:jumps` : show jump list

**Special marks:**  
- `''` : previous line  
- '```` : previous exact position  
- `'.` : last change  
- `'^` : last insert exit  
- `'[` / `']` : start/end of last change  

---

## 6️⃣ EDITING POWER MOVES

- `ciw` / `daw` : change / delete inner word  
- `di(` / `da(` : delete inside / around parentheses  
- `>` / `<` : indent / unindent visual selection  
- `gq` : reformat paragraph  
- `J` : join lines  
- `xp` : swap two characters  

---

## 7️⃣ UNDO & REDO

- `u` : undo  
- `<C-r>` : redo  
- `:earlier 5m` : go 5 minutes earlier  
- `:later 5m` : go 5 minutes later  

---

## 8️⃣ WINDOWS & TABS

- `:split` / `:vsplit` : horizontal / vertical split  
- `<C-w>w` : switch window  
- `<C-w>q` : close window  
- `:tabnew` : open new tab  
- `gt` / `gT` : next / previous tab  

---

## 9️⃣ FOLDING & OUTLINE

- `za` / `zc` / `zo` : toggle / close / open fold  
- `zR` / `zM` : open all / close all folds  
- `zf{motion}` : create fold over motion  

---

## 🔟 UNCOMMON BUT USEFUL

- `:keepjumps` : execute without affecting jump list  
- `:normal` : run normal mode command on range  
- `:global /pattern/command` : run command on all matching lines  
- `:registers` : list all registers  
- `gd` / `gD` : go to local / global declaration  
- `CTRL-G` : file info + cursor position  
- `:!command` : run shell command  
