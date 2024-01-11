# Tips

TAGS
---
git for-each-ref --sort=taggerdate --format '%(tag)'

tag by date
git for-each-ref --sort=taggerdate --format '%(tag)%09%(taggerdate:raw)%09%(*authorname)' refs/tags | awk '{print $1"\t\t"strftime("%F  %H:%M", $2)"\t"$4" "$5}'

alias
---
  tags = "!git for-each-ref --sort=taggerdate --format '%(tag)%09%(taggerdate:raw)%09%(*authorname)%09%(*subject)' refs/tags | awk '{print $1\"\t\t\"strftime(\"%F  %H:%M\", $2)\"\t\"$4\" \"$5\"  \t\t\"$6\" \"$7\" \"$8\" \"$9\" \"$10}'"

verbose
git for-each-ref --sort=taggerdate --format '%(tag) %(taggerdate:raw) %(taggername) %(subject)' refs/tags

pretty
git for-each-ref --sort=taggerdate --format '%(tag)_,,,_%(taggerdate:raw)_,,,_%(taggername)_,,,_%(subject)' refs/tags

git for-each-ref --sort=taggerdate --format '%(tag)_,,,_%(taggerdate:raw)_,,,_%(taggername)_,,,_%(subject)' refs/tags \
  | awk 'BEGIN { FS = "_,,,_"  } ; { printf "%-20s %-18s %-25s %s\n", $2, $1, $4, $3  }'

format
git for-each-ref --sort=taggerdate --format '%(tag)_,,,_%(taggerdate:raw)_,,,_%(taggername)_,,,_%(subject)' refs/tags \
  | awk 'BEGIN { FS = "_,,,_"  } ; { t=strftime("%Y-%m-%d  %H:%M",$2); printf "%-20s %-18s %-25s %s\n", t, $1, $4, $3  }'

conf
alias]
    # Show tags sorted by date
    tags = !"git for-each-ref \
        --sort=taggerdate \
        --format '%(tag)_,,,_%(taggerdate:raw)_,,,_%(taggername)_,,,_%(subject)' refs/tags \
        | awk 'BEGIN { FS = \"_,,,_\"  } ; { t=strftime(\"%Y-%m-%d  %H:%M\",$2); printf \"%-20s %-18s %-25s %s\\n\", t, $1, $4, $3  }'"

sum
git for-each-ref --sort=taggerdate --format '%(tag)_,,,_%(taggerdate:raw)_,,,_%(taggername)_,,,_%(subject)' refs/tags \
  | awk 'BEGIN { FS = "_,,,_"  } ; { t=strftime("%Y-%m-%d  %H:%M",$2); printf "%-20s %-18s %-25s %s\n", t, $1, $4, $3  }'

tags = !"git for-each-ref \
    --sort=taggerdate \
    --format '%(tag)_,,,_%(taggerdate:raw)_,,,_%(taggername)_,,,_%(subject)' refs/tags \
    | awk 'BEGIN { FS = \"_,,,_\"  } ; { t=strftime(\"%Y-%m-%d  %H:%M\",$2); printf \"%-20s %-18s %-25s %s\\n\", t, $1, $4, $3  }'"

Env variables
---
@see https://git-scm.com/book/en/v2/Git-Internals-Environment-Variables  

Exclude files
---
exclude files  
- .gitignore
- .git/info/exclude
- core.excludesfile '<file>'
  
Completion
---
https://github.com/git/git/tree/master/contrib/completion

#in "~/.bashrc"
. ~/git-completion.bash
. ~/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM=verbose
export GIT_PS1_DESCRIBE_STYLE=branch
export PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w $(__git_ps1 "(%s)")\$ '

ou
GIT_PS1_SHOWCOLORHINTS=1
```
export PROMPT_COMMAND='__git_ps1 "\u@\h:\w" " \\\$ "'
export PROMPT_COMMAND='__git_ps1 "\e[0;36m\u\e[m@\h:\e[0;36m\w\e[m" "\$ "'
```

filter-branch
---
```
git filter-branch -f --tree-filter 'git rm -rf --ignore-unmatch .\**\*.item*' --prune-empty -- --all

  git filter-branch --index-filter "git rm -rf --cached --ignore-unmatch Launcher\lib" --prune-empty -- --all
  git filter-branch --tree-filter "rm -rf Launcher\lib" --prune-empty -- --all
  git filter-branch --force --index-filter "git rm --cached --ignore-unmatch 'server/bin/some file.txt'" 
          --prune-empty --tag-name-filter cat -- --all

  git filter-branch --index-filter 'git update-index --remove **.item' HEAD
  git filter-branch --index-filter 'git-ls-files sensitive_stuff | xargs -d "\n" git-update-index --remove' HEAD
```

Init repo
---
(on remote server)  
$ cd repos  
$ mkdir myrepo && cd myrepo  
$ git init --shared=true  
$ git add .  
$ git commit -m "my first commit"  
$ cd ..  
$ git clone --bare myrepo myrepo.git

ou  
mkdir myrepo.git && cd myrepo.git  
git init --shared=true --bare  

Upload a repo (from local)
---
From host:  
$ mv myrepo.git ~/git-server/repos  
From remote:  
$ scp -r myrepo.git user@host:~/git-server/repos  

Clone a repo (from local)  
---
$ git clone ssh://git@<ip-docker-server>:2222/git-server/repos/myrepo.git  
$ git clone ssh://git@192.168.99.100:2222/git-server/repos/myrepo.git  

# ERROR
the remote end hung up unexpectedly, early EOF, index-pack failed

  try n°1  
git config --global http.postBuffer 524288000  
git config --global core.compression 9  

  try n°2  
git config --global core.compression 0  
git clone --depth 1 <repo_URI>  
  cd repo_URL  
git fetch --unshallow  OR git fetch --depth=2147483647  
  then  
git pull --all
