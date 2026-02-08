ZSH DAILY EXPERT SHORTCUTS — SENIOR PRO
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
- > : Redirect output to file (overwrite)
- >> : Append output to file
- 2> : Redirect stderr
- &> : Redirect stdout and stderr
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

Cyril MATTÉ
06 65 46 75 05
