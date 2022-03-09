# Tips

TAGS
git for-each-ref --sort=taggerdate --format '%(tag)'

tag by date
git for-each-ref --sort=taggerdate --format '%(tag)%09%(taggerdate:raw)%09%(*authorname)' refs/tags | awk '{print $1"\t\t"strftime("%F  %H:%M", $2)"\t"$4" "$5}'

[alias]
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
