# Git Tips

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


Commands
--------
### Add
git add -(i)nteractive  
git add -(p)atch (answer y/n for each hunk)  
git add -(e)dit  
git add -A / -u (tout le dépot)  
git add --(no-)all[^2] (se base uniquement sur working dir)  
git add --(no-)ignore-removal  

### Apply

### Bisect
git bisect start  
git bisect bad  
git bisect good v1.9.0  
git bisect visualize  

### Blame
(infos sur un fichier)
git blame README.MD -w (whitespace) -M (modifs) -C (other modifs)  

### Branch
git branch <branch_name> <commit_base>  
git branch v1.14-0.1 <commit_de_base>  

git branch -a (list remotes)  
git branch -d future-plans (delete safe)  
git branch -D future-plans (force deleting!)  
git branch -r (remote)  
git branch -m <branch> (rename)  
git branch --list pr-* (regex)  
git branch --track origin/feat5 (suivre remote branch)  
git branch --set-upstream-to=origin/topic topic  

- Modify or delete
git branch -m feature/OPFR-1234 feature/OPFR-4321    
git branch -D feature/OPFR-XXXX    
git push --delete origin feature/OPFR-XXXX   

- créer une nouvelle branche
git checkout -b <branch> master    
git checkout -b <branch> --track origin/<branch>    

- remotes
git remote add new-remote-repo https://bitbucket.com/user/repo.git  
git push <new-remote-repo> experiment~  
git push origin --delete experiment (delete remote)  
git push origin :experiment (delete remote)  
	
- Delete remote branch on local
git fetch --all --prune    

- create new remote branch
(if git push --set-upstream origin test2 doesn't work)  
git push origin HEAD:test2  

- move branch head place
git branch -f <branch-name> <new-tip-commit>  
 or with  
git update-ref   

- See branch config
git branch -vv --all  
git config --list OR --get-regex 'branch'  

- parent de la branche courante
git show --summary $(git merge-base test2 master)  

- Show remote  
**See remote from config**   
git config remote.$(git config branch.master.remote).url  
git config remote.origin.url  
git remote show origin  

### Checkout
(files, commits, and branches.)  
git checkout -- <filename> (undo changes)  
git checkout HEAD -- string_operations.c  
git checkout -b <new-branch> <existing-branch> -(t)rack <origin/branch> (use existing-branch as base)  
git checkout <remotebranch>  
git checkout v1.4  

- after fetch
git diff --stat -p remotes/origin/master <file>  
git checkout master -- <file>  

### Cherry-pick
git cherry-pick <commitSHA> --edit (message) --no-commit (copy only files) --signoff (signature)  

- récupère un commit précédent  
git cherry-pick -  
git cherry-pick @{-1}  

### Clean (Remove untracked files & dirs)  
git clean -n -d   # list all files/directories that would be removed  
git clean -f  
git clean -(i)nteractif  
git clean -x (fichiers ignorés)    
  
git clean -fd --dry-run --interactive    
    -x (dont use .gitignore) -e (exclude) <pattern>    
    -X (use .gitignore)  

### Clone
- for big project  
git clone --depth [depth] [remote-url]   
git clone [remote url] --branch [branch_name] --single-branch [folder]  

### Commit
git commit -a (auto stage) -m <msg>  
git commit --amend -m <msg>  

- update last (like git reset --soft HEAD^)  
git commit --amend (modify last commit, add files, edit msg)  
git commit --amend --no-edit (sans modif du msg)  

- change last commit message  
git commit --amend -m '[OPFR-5694] Modification'  

- git < 1.7.9  
git commit --amend -C HEAD  
	    
- fixup and rebase 
git commit --fixup <hash>
git rebase -i --autosquash

### Describe
git describe --tags    
git describe --abbrev=0 --tags  
  
### Diff
git diff HEAD (between workingdir and last commit)  
git diff --base <filename>  --color-words  
git diff <sourcebranch> <targetbranch>  
git diff --cached ./path/to/file (like --staged)  
git diff --staged index.html  
git diff -w (--ignore-all-space)  
git diff --word-diff (non plus par ligne mais par mot)  
git diff --word-diff=color (--color-words) (--color-words=<regex>) (exprime ce qu'est un mot)  
git diff --word-diff-regex=<regex> (--word-diff-regex=.)  

- tips
git diff --stat --cached origin/master (about to commit)  
	
git diff fichier1 fichier2 ...    
git difftool    
git diff branch_1 origin/branch_1    
    
- **for environement**    
git diff --cached (index <> last commit)    
git diff (index <> working tree)    
git diff HEAD (last commit <> working tree)   

### Fetch  
git fetch --all origin  
git fetch <remote> <branch> --dry-run  

- ex
git fetch coworkers feature_branch  
git checkout coworkers/feature_branch  
git checkout -b local_feature_branch  
	
### Filesystem  
**In case of errors, or breaked HEAD**    
git fsck --full  

### Filter-branch  
- split subfolder to a new repo  
git filter-branch --prune-empty --subdirectory-filter <folderName> master  

- supprimer un fichier de toutes les branches (infos sensibles)  
git filter-branch --index-filter 'git rm --cached <file>' HEAD  

- git filter-branch -f --tree-filter 'git rm -rf --ignore-unmatch ./**/*.item*' --prune-empty -- --all  
- git filter-branch -f --tree-filter 'git rm -rf --ignore-unmatch ./**/diehard.json' --prune-empty -- --all  
- git grep -l 'original_text' | xargs sed -i 's/original_text/new_text/g'  

### Format-patch
- apply a patch from unrelated repository  
git format-patch  --git-dir=<pathToOtherLocalRepo>/.git -k -1 --stdout <otherLocalCommitSHA> | git am -3 -k  

### GC
git gc (garbage collector)

### Log
git log -- foo.py bar.py  
git log --all --decorate --oneline --graph  (--abbrev-commit)  
git log --stat (number modifs)   
git log -p (inside files)   
git log --after="2014-7-1" --before="2014-7-4"  
git log --author="John\|Mary"   
git log -S"Hello, World!" (inside file) -i (case insensitive)  
git log -S'text inside' --pickaxe-regex -- <path/file>  
git log -G"<regex>" -i  
git log --grep="JRA-224:"  
git log master..feature --no-merges  
git log <since>..<until>  
git log --oneline master..feature  
git log -n 10 (or -10) (only 10 last)  
git log -- . ':!dir' (tout sauf)  
git log --exclude='*/*' --branches  
git shortlog  
	
- **First branch commit with "develop"**  
git show -s --oneline $(git log --oneline --format="%H" --reverse develop.. | head -1)  

- **First project commit**  
git rev-list --max-parents=0 HEAD  
git log --reverse -1  

- **Grep**  
git log --grep="xxx"  

- **List of specific commit's files**  
git show --pretty=oneline --name-only <commit_id>  

- After Fetch
git log --oneline master..origin/master  

- ex
git log -S"CSS3D and WebGL renderers." --pretty=format:'%h %an %ad %s'  

- only for one branch  
git log set --first-parent --oneline --not master  
git rev-list --oneline <branch> --not master  

git log master..  
git log master..<branch>  
git cherry -v master  

### Merge
git merge <merging-branch1> <merging-branch2> (in current)  
git merge master someone-feature feature3  

git merge --abort  
git merge - (pour fusionner la branche qu'on vient de quitter)  
- check base  
git merge-base feat01 master C D   

- after fetch  
git checkout feature  
git merge origin/feature  

- strategy
git merge -s recursive branch1 branch2 (default with one branch)  
git merge -s resolve branch1 branch2 (3 heads)  
git merge -s octopus branch1 branch2 branch3 branchN  
git merge -s ours branch1 branch2 branchN  
git merge -s subtree branchA branchB (like recursive)  

- types
explicit: create new commit  
implicit: rebase or ff  
squash: when interactive rebase  

### Patch  
git format-patch -1 (create patch)  
git apply 0001-Added-my_strcat-function.patch  

### Pull
. git fetch origin  
. git merge origin/next  

git pull --rebase=preserve (recommandé!)  
git pull --rebase --preserve (--preserve-merges)  

git pull --rebase origin master  
git pull --all  
git pull --verbose  

### Pull-request

### Push  
git push -u (--set-upstream) origin new-feature   
git push <remote> --tags --force --all  

- delete remote branch  
git push origin :some-feature (delete some-feature in origin)  
git push origin --delete some-feature  

- force  
git push origin +HEAD (force-push the new HEAD commit)  
	
- **push specific commit**  
git push -u origin commit_hash:main

- **on specific remote**  
git push other_repo HEAD:main  

- submodules  
git push --recurse-submodules=check|on-demand  

- tags
git push origin v1.4  
git push --tags origin v1.4 v1.5  

- tips: Undo a git push:  
git push -f origin <last_good_commit>:<branch_name> (ex: cc4b63bebb6:alpha-0.3.0)  

### Rebase (never on public) !!!  
git rebase master  
git rebase HEAD~3  
git rebase --autosquash  
git rebase -- d (commit supprimé) -- p (commit laissé tel quel)  
    (ne pas oublier "git merge" ensuite)  
git rebase --root  
git rebase -i @{-1}  
git rebase - (la branche précédente)  
git rebase --(p)reserve-merges  

- sample  
git rebase master <moving_branch>  
..git checkout <branch>  
..git rebase master  
          A---B---C <branch>  
        /  
    D---E---F---G master  
devient:  
	                     A'--B'--C' topic  
                            /  
    D---E---F---G master  

- interactif  
git rebase -i master   
  pick, (r)eword, (f)ixup, (s)quash...  
git rebase -i HEAD~2 (rebase last 2)  

git rebase -i --exec "cmd1 && cmd2 && ..."  
  
- onto  
git rebase --onto <newbase> <oldbase>  
git rebase --onto <newbase> <oldbase> <moving-branch>  
git rebase featureA featureB --onto master  
 o---o---o---o---o master  
           o---o---o---o---o featureA  
                  o---o---o featureB  

devient:  
			o---o---o featureB  
    o---o---o---o---o master  
         o---o---o---o---o featureA  

- erase a commit  
git rebase --onto topicA~5 topicA~2 topicA  
git push origin topicA -f  

E---F---G---H---I---J  topicA  
devient:  
E---H'---I'---J'  topicA  

1. 138fd8c docker  
2. e87dd63 clean  
3. 802c39b Update bubble_sort.php  
4. 3f7fc31 Create bubble_sort.php  
5. 97ea674 Update insertion_sort.php  

devient:  
1. 75c0c5d docker  
5. 97ea674 Update insertion_sort.php  

- erase 2eme exemple  
1. 4e137a1 - (5 seconds ago) create past.rb -  (HEAD -> master, origin/master)  
2.  2c9c44b - (66 seconds ago) remove edit.rb -   
3.  a4815ce - (15 minutes ago) add name param -   
4.  c36174a - (57 minutes ago) create edit.rb amended - tutoname  
5.  3e86b09 - (72 minutes ago) create edit.rb - tutoname  
6. 6f4becc - (3 days ago) test -   

> git rebase --onto 6f4becc 2c9c44b master(optional when one branch)  

1. 00c169f - (5 minutes ago) create past.rb -  (HEAD -> master)  
6. 6f4becc - (3 days ago) test -   

(eventuellement git cherry-pick)  
git push origin +HEAD (force)  

1. 00c169f - (10 minutes ago) create past.rb -  (HEAD -> master, origin/master)  
6. 6f4becc - (3 days ago) test -   
	
- **Rebase branch with conflict in main favor**  
git rebase main -s recursive -X theirs  

- **From root interactive**  
git rebase --root -i
    
- **Only last 2 commits**
git rebase HEAD^2 --onto <newbase>   

- tips
Rebase fréquent d'une branche parallèle en dev  
git rebase --continue --abort  

### Ref / reflog
git reflog --relative-date  
git checkout HEAD@{1}  
- HEAD – The currently checked-out commit/branch.  
- FETCH_HEAD – The most recently fetched branch from a remote repo.  
- ORIG_HEAD – A backup reference to HEAD before drastic changes to it.  
- MERGE_HEAD – The commit(s) that you’re merging into the current branch with git merge.  
- CHERRY_PICK_HEAD – The commit that you’re cherry-picking.  

### Remote
- ssh://user@host/path/to/repo.git  
git remote add origin <server_url>  
git remote -v  
git remote rm <name>  
git remote rename <old-name> <new-name>  
git remote show <upstream>  
git remote add coworkers_repo git@bitbucket.org:coworker/coworkers_repo.git  
git remote add -f <local_name> https://bitbucket.org/vim-plugins-mirror/vim-surround.git  
git remote add durdn-vim-surround ssh://git@bitbucket.org/durdn/vim-surround.git  

git remote show origin (show branches)  

- only one branch  
git remote add -t <remoteBranchName> -f origin <remoteRepoUrlPath>  

### Reset  
- Reset: reset the 3 trees to match the state of a specified commit  
git reset --keep --merge  
git reset --hard origin/<branchname> (get the last remote commit)  
git reset HEAD~2 --soft (commits history) --mixed (default, commits and staging) --hard (all match now the commit)  
git reset HEAD~2 foo.py  
git reset HEAD^ # remove commit locally  
git reset -p HEAD^ index.html (patch only one hunk, inverse de add -p)  
git reset --merge ORIG_HEAD  

- The three trees:  
Working dir, staged snapshot (git add .), commit history  

git reset fichier1 fichier2 rep1 ...     
git reset --hard origin/HEAD

### Revert / rm  
- Revert: create the opposite of a single commit (safe public)  
git revert <commit>   

- Rm
git rm -f (--force) -n (--dry-run) -r (recursive)  
git rm --cached (only staging) -- <file1><file2>  
git rm Documentation/\*.txt  

### Show
git show --pretty[=<format>] oneline, short, medium, full, fuller, email, raw, et format:<string>  
git show --(-no)-abbrev-commit --oneline  
git show --show-signature    
git show --(-no)-notes=<ref>  
git show --(-no)-expand-tabs=<n>  
git show feature-01  
git show refs/heads/feature-01  
git show --pretty="" --name-only bd61ad98  
git show REVISION:path/to/file  
git show v2.0.0 6ef002d  
git show commitA...commitD  
git show :0:index.html (voir le snapshot du stage)  

- **List of author of last 5 commits**  
git show -s --format="%ae" $(git rev-list -5 --all) 

- branches   
git show-branch --(a)ll <branch>  
git show-branch --(r)emotes  

- ex
git show $(git rev-parse master)  

### Status
git status -(u)ntracked-files  

### Stash
git stash apply  
git stash pop (apply and remove) --index (reconstruit l'index)  
git stash pop stash@{2}  
git stash show -p  
git stash branch (creer une nouvelle branch)  
git stash -u --incl(u)de-untracked  
git stash -a (-all) (include ignored files)   
git stash -k (stash what-s not in index)  
git stash list  
git stash save "message inclus"  
git stash drop stash@{1}  
git stash clear  
git stash save --keep-index  (stash only unstaged files)  

- Inspect 
git log --oneline --graph stash@{0}  

- env
GIT_PS1_SHOWSTASHSTATE=1  

### Status
git status -(u)ntracked-files  

### Submodule
git submodule add https://bitbucket.org/jaredw/SUBDIR  
.. .gitmodules  
.. SUBDIR  
git submodule init <module-name>    
git submodule update  

git clone --recursive (--recurse-submodules)  

- add local repository  
git submodule add --force --branch dev git@github.com:<remote_path>/<remote_path> <../local_path_dir>  

-> prefer "Subtree" instead  

### Subtree
git subtree add --prefix <dir/path> <origin2_stream> master --squash  
git subtree pull --prefix <dir/path> <origin2_stream> master --squash  

- Contribute
git subtree push --prefix=<dir/path> <origin3_stream> master  

- Without subtree command
git remote add -f tpope-vim-surround https://bitbucket.org/vim-plugins-mirror/vim-surround.git  
git merge -s ours --no-commit tpope-vim-surround/master  
git read-tree --prefix=.vim/bundle/tpope-vim-surround/ -u tpope-vim-surround/master  
git commit -m "adding tpope-vim-surround" <subtree>  
git pull -s subtree tpope-vim-surround master  

- Quick way
git subtree add --prefix .vim/bundle/tpope-vim-surround   
	https://bitbucket.org/vim-plugins-mirror/vim-surround.git master --squash (skip the entire project)  
git subtree pull --prefix .vim/bundle/tpope-vim-surround   
	https://bitbucket.org/vim-plugins-mirror/vim-surround.git master --squash  

### Tags
git tag 1.0.0 <commitID> (1.0-lw léger)  
git tag -a v1.4 (annoté avec auteur, etc)  
git tag -a v1.4 -m "my version 1.4"  
git tag -l *-rc* (like)  
git tag -a -f v1.4 15027957951 (force modif)  
git tag -d v1 (delete)  

- to remote  
git push tags/<nom_du_tag> like a branch  
git push origin <tagname>  
git push origin --tags (all tags)   

- sample
git tag -a CN18.1.0.2 -m CN18.1.0.2  
git push origin --tags  
git tag -d mon_tag      # (delete)  
git push origin --delete mon_tag    # (delete remote)  
git fetch origin "+refs/tags/*:refs/tags/*"     # (recupère les tags supprimés du distant)
	
### Tracking
git add -f <ignored_file>  
git rm --cached <file_to_ignore>

---
### Good practice
- si branch de dev temporaire (à enlever)  
on rebase pendant que master évolue sinon --f(ast)f(orward)  
ou alors merge --fast-forward pour lisser l'historique  

- si branch utile (fix ou feature) a garder  
si master n'as pas bougé, utiliser --no-ff pour forcer la branche (true merge)  

- rebase souvent le temps du dev pour eviter conflits finaux  
- si push refusé, on rebase proprement sur la nouvelle branche distante  

- ex
git commit --amend
git merge, avec ou sans --no-ff
git rebase, et notamment git rebase -i et git rebase -p
git cherry-pick (qui est fonctionnellement inséparable de rebase)

### Navigate
HEAD^^ (go to 2dn before HEAD)  
HEAD^3^2 (go to 3dn before HEAD passing 2nd parent branch)  
HEAD~3 (go back by 3 before HEAD)  

Plumbing
---
### Cat-file
git cat-file -p <commit> (see infos on commit)  

### Checkout-index
git checkout-index (Copy files from the index to the working tree)  

### Commit-tree

### Diff-index

### For-each-ref

### Hash-object

### Ls-files
git ls-files -s (index de staging)  

### Ls-tree

### Merge-base

### Read-tree

### Rev-list

### Rev-parse
git rev-parse master (resolve hash)  

### Show-ref

### Symbolic-ref
git symbolic-ref HEAD

### Update-index
- ignore changes in tracked file  
git update-index --assume-unchanged <pathToLocalFile>  
git update-index --skip-worktree <file-list>  

### Update-ref
- move branch head place  
git update-ref refs/heads/<branch> <commit>  -m "reset: Reset <branch> to <new commit>"  
git update-ref <ref> <commit>    -m "reset: Reset <branch> to <new commit>"  

+ Samples  
Get the number of frames    
numframes=`gifsicle $1 -I | grep -P "\d+ images" --only-matching | grep -P "\d+" --only-matching`

- git assume-unchanged
- git worktree add <répertoire> <branche>


References
----------
+ [atlassian.com](atlassian.com)
+ [githowto](https://githowto.com/)
+ [Tuto](https://www.atlassian.com/fr/git/tutorials)
+ [30 options](https://delicious-insights.com/fr/articles/30-options-git-qui-gagnent-a-etre-connues/)
+ [Gitflow - Nvie](https://nvie.com/posts/a-successful-git-branching-model/)
+ [Beginner](https://www.atlassian.com/git/tutorials/svn-to-git-prepping-your-team-migration)
+ [Cheat sheets](https://www.atlassian.com/git/tutorials/atlassian-git-cheatsheet)
+ [git-request-pull] (https://git-scm.com/docs/git-request-pull)

---
@see:  
* https://delicious-insights.com/fr/articles/prompt-git-qui-dechire/
* https://git-scm.com/book/fr/v2/Git-dans-d%E2%80%99autres-environnements-Git-dans-Bash
* https://www.journaldunet.fr/web-tech/guide-de-l-entreprise-digitale/1443846-influxdb-une-base-de-donnees-time-series-open-source-sur-optimisee
- https://delicious-insights.com/fr/articles/git-submodules
- https://doabledanny.gumroad.com/l/git-commands-cheat-sheet-pdf
- https://www.30secondsofcode.org/git/p/1
- https://ohshitgit.com

Cheatsheets
---
* https://gist.github.com/mpeshev/9550375
* https://gist.github.com/PaulCapestany/cebfbd54b0c25b6bd8b9
* https://gist.github.com/chrismccoy/8775224

**Git to changelog**  
* http://git.savannah.gnu.org/gitweb/?p=gnulib.git;a=blob_plain;f=build-aux/gitlog-to-changelog
