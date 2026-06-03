# Zsh

- [Bash2Zsh refcards](https://www.bash2zsh.com/zsh_refcard/refcard.pdf)
- [Zsh Guide](https://zsh.sourceforge.io/Guide)

- [Zsh Cheatsheet](https://gist.github.com/ClementNerma/1dd94cb0f1884b9c20d1ba0037bdcde2)

-> [Grep-Sed-Awk-sort...-non](https://jonathanpoelen.github.io/2019/01/grep-sed-awk-sort...-non--zsh)

## Stdout
```
https://zsh.sourceforge.io/Doc/Release/Redirection.html
https://csatlas.com/bash-redirect-stdout-stderr/

    1 = stdout
    &2 = duplicate file descriptor 2 (stderr)

redirect stdout  to stderr
command 1>&2

or more simply:
command >&2

 # Redirect stdout and stderr to file combined.log
cmd 1>combined.log 2>&1 
```
