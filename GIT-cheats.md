Git Sample
==========

1. Configuration
    - Autocompletion
2. Porcelain
3. Plumbing
    - Submodules
    - Worktree
    - Other

--------------------------------------------------------------------------------------
## 1. Configuration

* Autocompletion

https://git-scm.com/book/en/v2/Appendix-A%3A-Git-in-Other-Environments-Git-in-Bash  
https://www.oliverspryn.com/blog/adding-git-completion-to-zsh  

```
mkdir -p ~/.zsh  && cd ~/.zsh       
curl -o git-completion.zsh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh
```

-> in ~/.zsh  
```
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath) 
autoload -Uz compinit && compinit
```

```
git config --global credential.helper 'store --file ~/.my-credentials'
```



--------------------------------------------------------------------------------------
## 2. Porcelain



--------------------------------------------------------------------------------------
## 3. Plumbing

* Submodules

```
git submodule init
git submodule update --init --recursive
git submodule foreach sh -c 'git pull'

git pull --recurse-submodules 
```

* Worktree

```
Remove stages : git reset .    
Remove changes : git restore .   
Remove untracked changes : git clean -f -d
``` 

* Other

```
PREVIOUS_BRANCH=`git rev-parse --abbrev-ref HEAD -- | head -n 1`    
NEW_RELEASE=`git branch --all | grep -o '\(release\)/[0-9]*' | sort -V | tail -n 1 | awk -F'[/.]' '{print "release/"$2"."$3"."$4+1}'`   

Search in all files : git rev-list --all | xargs git grep -F '<Your search string>'
```

---
**@Ref**  
- https://acompiler.com/git-tips
- https://github.com/git-tips/tips
- https://github.com/arslanbilal/git-cheat-sheet
- https://maciejb2k.github.io/no-bs-git (Git no bs)
