ZSH DAILY - ONE FILE CHEAT
===

## COMMAND LINE NAVIGATION
- Ctrl+A : Move cursor to beginning of line
- Ctrl+E : Move cursor to end of line
- Alt+B : Move backward one word
- Alt+F : Move forward one word
- Ctrl+B : Move backward one character
- Ctrl+F : Move forward one character
- Ctrl+L : Clear screen (like clear)

## HISTORY & COMMAND RECALL
- Ctrl+R : Reverse search history (incremental)
- Ctrl+S : Forward search history
- !! : Repeat last command
- !n : Repeat nth command in history
- !-n : Repeat nth command from last
- !string : Repeat last command starting with string
- Ctrl+P : Previous command (history up)
- Ctrl+N : Next command (history down)
- history : Show numbered command history
- fc : Edit command in $EDITOR, then execute

## WORD/LINE EDITING
- Ctrl+U : Delete from cursor to beginning of line
- Ctrl+K : Delete from cursor to end of line
- Ctrl+W : Delete previous word
- Alt+D : Delete word forward
- Ctrl+Y : Paste last deleted text (yank)
- Alt+Y : Cycle through kill-ring (after Ctrl+Y)
- Esc+T : Transpose words
- Ctrl+T : Transpose characters
- Alt+U : Uppercase word
- Alt+L : Lowercase word
- Alt+C : Capitalize word

## PROCESS MANAGEMENT & JOBS
- Ctrl+Z : Suspend current process (background)
- bg : Resume suspended job in background
- fg : Resume suspended job in foreground
- jobs : List jobs
- kill %n : Kill job number n
- Ctrl+C : Kill current foreground process

## AUTO-COMPLETION & SUGGESTIONS
- Tab : Autocomplete command/file
- Alt+Tab : Autocomplete partial paths/commands
- Ctrl+X Ctrl+E : Open current command in $EDITOR
- setopt AUTO_LIST : Automatically list completions
- setopt CORRECT : Auto-correct mistyped commands
- setopt AUTO_MENU : Menu-style completion

## ALIAS & SHORTCUT MANAGEMENT
- alias ll='ls -lah' : Example alias
- unalias ll : Remove alias
- fc -l 1 : List last command for editing
- !!:gs/old/new/ : Replace string in last command

## ENVIRONMENT & SCRIPTS
- export VAR=value : Set environment variable
- echo $VAR : Print variable
- source ~/.zshrc : Reload Zsh config
- .`command` : Execute command in current shell
- $(command) : Command substitution

## PIPES, REDIRECTION & FILE SHORTCUTS
- | : Pipe output to next command
- `>` : Redirect output to file (overwrite)
- `>>` : Append output to file
- `2>` : Redirect stderr
- `&>` : Redirect stdout and stderr
- Ctrl+Alt+F : (custom) navigate directory fast (with fzf)
- cd - : Go to previous directory
- pushd/popd : Directory stack navigation

## ZSH-SPECIFIC SUPERPOWERS
- Ctrl+X Ctrl+R : Re-read current line from editor
- Alt+. : Insert last argument of previous command
- Alt*_ : Expand all previous arguments matching pattern
- Ctrl+G : Abort completion
- Esc+.` : Insert last word of previous command
- setopt HIST_IGNORE_DUPS : Ignore duplicate commands in history
- setopt SHARE_HISTORY : Share history across sessions
- bindkey '^R' history-incremental-search-backward : Smart reverse search

## PRO WORKFLOWS / EXPERT HACKS
- Fast multi-command chaining: `cmd1 && cmd2 && cmd3`
- Use history search: Ctrl+R + partial command → execute → Alt+. for args
- Directory jumping: pushd/popd + dirs
- Fuzzy file navigation: `fzf` + Alt+Ctrl shortcuts
- Environment quick swap: export VAR=value → run scripts → revert
- Kill/relaunch workflow: jobs → fg/bg → Ctrl+C/kill
- Command edit in $EDITOR for complex multi-line commands: Ctrl+X Ctrl+E
- Combine completion + multi-arg substitution: Tab + Alt+. + Ctrl+Y


---

ZSH WORKFLOW SEQUENCES — DAILY USE
===

RAPID FILE NAVIGATION & EDITING
```
# Jump to recent directories, find files, edit quickly
cd ~/projects # go to project root
pushd . # save current dir
ls -lah # list contents
Ctrl+R + 'vim' # reverse search last vim command
vim $(fzf) # fuzzy find file, open in editor
Alt+. # insert last argument from previous command
Ctrl+X Ctrl+E # edit complex command in $EDITOR
: wq # save & exit editor → executes command
```

HISTORY-BASED REUSE WORKFLOW
```
Ctrl+R + 'git commit' # search history for git commit
Alt+. # reuse last argument from previous git command
!! # repeat last command
!!:gs/old/new/ # replace text in last command before executing
fc # open last command in editor for multi-line edit
Ctrl+P / Ctrl+N # scroll through history quickly
Esc+. # cycle previous arguments from history
```

MULTI-COMMAND & PIPELINE EXECUTION
```
# Chain commands without breaking flow
cmd1 && cmd2 && cmd3 # sequential execution, stop on fail
cmd1 | tee out.log | less # pipeline with logging & paging
cmd1 & # background process
jobs # list background jobs
fg %1 # bring job #1 to foreground
kill %2 # terminate background job #2
```

DIRECTORY STACK & PROJECT SWITCHING
```
pushd ~/project1
pushd ~/project2
dirs # show directory stack
popd # return to previous directory quickly
cd - # jump to last directory
fzf + cd # fuzzy search directories for instant jump
Alt+. for last argument paths # reuse last directory/file
```

AUTO-COMPLETION & EXPERT EDITING
```
Tab # complete command or path
Alt+Tab # cycle multiple completions
setopt AUTO_LIST # list completion automatically
setopt CORRECT # autocorrect commands
Ctrl+U / Ctrl+K / Ctrl+W # delete to start / end / previous word
Ctrl+Y # paste last kill
Alt+Y # cycle through previous kills
Esc+T / Ctrl+T # transpose words / characters
Alt+U / Alt+L / Alt+C # uppercase / lowercase / capitalize word
```

ENVIRONMENT & QUICK SWITCH
```
export VAR=value # set variable
echo $VAR # show variable
source ~/.zshrc # reload config without restarting
alias gs='git status' # define shortcut
unalias gs # remove shortcut
Ctrl+X Ctrl+E # edit complex env commands in $EDITOR
history | grep pattern # search history with grep
```

FZF + FUZZY NAVIGATION WORKFLOWS
```
# Fast file/project navigation
fzf # fuzzy find files or history
fzf + Alt+. # reuse previous argument or directory
ctrl-r + fzf # reverse search with fuzzy filter
ctrl-x ctrl-e # edit selected command in $EDITOR
pushd $(fzf) # jump to fuzzy-selected directory
```

PROCESS MANAGEMENT WORKFLOW
```
Ctrl+Z # suspend current process
bg # resume background
fg # bring to foreground
jobs # list jobs
kill %1 # terminate job #1
ps aux | grep process_name # search running processes
Ctrl+C # terminate foreground process immediately
```

SEARCH & REPLACE IN COMMANDS
```
Ctrl+R + partial command # search previous commands incrementally
!!:gs/old/new/ # replace text in last command
Alt+. # insert last argument from previous command
fc # edit previous command in $EDITOR
Ctrl+R → Alt+. # chain history reuse + last argument insertion
```

EXPERT DAILY WORKFLOWS
```
# 1. Rapid project jump + edit
pushd ~/projects && ls -lah && vim $(fzf)

# 2. Multi-command git workflow
Ctrl+R 'git status' → Alt+. → git add file → Ctrl+R 'git commit' → Alt+. → !! → Ctrl+X Ctrl+E for multi-line message

# 3. Background build + terminal focus
make & → jobs → fg %1 → Ctrl+C to stop if needed → repeat

# 4. Bulk edit history commands
history | grep pattern → fc → edit in $EDITOR → execute multiple commands

# 5. Complex pipelines
cmd1 | cmd2 | tee output.log | less → Ctrl+Y / Alt+Y to reuse pipe results

# 6. Multi-directory workflow
pushd dir1 → pushd dir2 → popd → cd - → Alt+. for quick argument reuse

# 7. Fuzzy search everywhere
fzf → Ctrl+R → Alt+. → Ctrl+X Ctrl+E → execute multi-step command sequence
```
