# Tips
[status]
    submodulesummary = 1

[alias]
    ign = ls-files -o -i --exclude-standard

[alias]
    uncommit = reset HEAD~1 --mixed

gpg = log --show-signature


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


exemple
[user]
    name = Cytopia
    email = cytopia@everythingcli.org
    signingkey = 28BF179F


[core]
    # Check if converting CRLF is reversible
    # and abort if not
    safecrlf = true

    # Better git diff view
    pager = less -x1,5

    # whitespace fix
    #
    # trailing-space: treats trailing whitespaces at the end of the line
    # space-before-tab: treats a space character that appears immediately before a tab character in the initial indent part of the line as an error
    whitespace = blank-at-eol,blank-at-eof,space-before-tab,trailing-space

    ignorecase = false

[apply]

    # Warn about whitespace issues defined in core.whitespace
    whitespace = warn

[merge]
    summary = true

    # No fast forward merge
    # I want to see the merge tree instead
    # of a flat merge
    ff = false

[alias]

    ################################################################################
    # Action Commands

    # Uncommit previous 'git commit'
    #
    # Files are still there and you will have
    # to stage them again.
    #
    # This is useful, if you are back to work the
    # next day and want to uncommit yesterday's commit
    # in order to see what you have done
    uncommit = reset HEAD~1 --mixed

    # This commits everything in my working directory
    # and then does a hard reset to remove that commit
    #
    # The nice thing is, the commit is still there, but it's just unreachable.
    # Unreachable commits are a bit inconvenient to restore,
    # but at least they are still there.
    # You can run the git reflog command and find the SHA
    # of the commit if you realize later that you made
    # a mistake with the reset. The commit message will be "WIPE SAVEPOINT" in this case.
    wipe = !git add -A &amp;&amp; git commit -qm 'WIPE SAVEPOINT' &amp;&amp; git reset HEAD~1 --hard

    ################################################################################
    # View git log

    # git log
    tree = log --graph --decorate --abbrev-commit --branches --tags --remotes --date=short --pretty=format:'%C(yellow)%h%Creset-%C(cyan)(%ai%x08%x08%x08%x08%x08%x08) %ar%Creset%C(bold green)%d%Creset %s %Creset %C(cyan)[%cn]%Creset'
    lg = log --stat --abbrev-commit --show-signature
    gpg = log --show-signature

    ################################################################################
    # View Hash

    # Show current tag, if available
    current = !sh -c 'git name-rev --tags --name-only $(git rev-parse HEAD)'

    # List all git tags ordered by date
    tags = "!git for-each-ref --sort=taggerdate --format '%(tag)%09%(taggerdate:raw)%09%(*authorname)%09%(*subject)' refs/tags | awk '{print $1\"\t\t\"strftime(\"%F %H:%M\", $2)\"\t\"$4\" \"$5\" \t\t\"$6\" \"$7\" \"$8\" \"$9\" \"$10}'"

    ################################################################################
    # View files

    # List files (indexed)
    ls = ls-tree --name-only -r HEAD

    # List files (ignored)
    ign = ls-files -o -i --exclude-standard
    ls-ign = ls-files -o -i --exclude-standard
    ls-ignored = ls-files -o -i --exclude-standard

    # List files (modified)
    ls-mod = ls-files -m
    ls-modified = ls-files -m

    # List files (deleted)
    ls-del = ls-files -d
    ls-deleted = ls-files -d

    # List files (unmerged)
    ls-unm = ls-files -u
    ls-unmerged = ls-files -u

[color]
    ui = true
    [color "branch"]
    current = yellow bold
    local = green bold
    remote = cyan bold
[color "diff"]
    meta = yellow bold
    frag = magenta bold
    old = red bold
    new = green bold
    whitespace = red reverse
[color "status"]
    added = green bold
    changed = yellow bold
    untracked = red bold
    
Init repo
=========
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
------
From host:  
$ mv myrepo.git ~/git-server/repos  
From remote:  
$ scp -r myrepo.git user@host:~/git-server/repos  

Clone a repo (from local)  
-----
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
