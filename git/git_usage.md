GIT USAGE
=========

BRANCHES
------
##### * Create
git checkout -b <branch> --track origin/<branch>

##### * Modify or delete
git branch -m feature/OPFR-1234 feature/OPFR-4321  
git branch -D feature/OPFR-XXXX  
git push --delete origin feature/OPFR-XXXX  

##### * Delete remote branch on local
git fetch --all --prune 

##### * Show remote  
**See from config** 
git config remote.$(git config branch.master.remote).url
git config remote.origin.url
git remote show origin

**See tracking branch**  
git branch --all -vv

CONFIG
------
**Exclude files**  
vim .git/info/exclude  

**Proxy**
git config http.proxy 'http://user:pass@proxy_url:8080'

CLEAN - Remove untracked files & dirs
-----
git clean -fd --dry-run --interactive  
    -x (dont use .gitignore) -e (exclude) <pattern>  
    -X (use .gitignore)

COMMIT
------
git commit --amend -m '[OPFR-5694] Modification'    # (change last commit message)

DIFF
----
git diff fichier1 fichier2 ...  
git difftool  
git diff branch_1 origin/branch_1  
    
**for environement** 
git diff --cached (index <> last commit)  
git diff (index <> working tree)  
git diff HEAD (last commit <> working tree)  

FILESYSTEM
----------
**In case of errors, or breaked HEAD**  
git fsck --full

LOGS
---- 
**First branch commit with "develop"**  
git show -s --oneline $(git log --oneline --format="%H" --reverse develop.. | head -1)  

**First project commit**  
git rev-list --max-parents=0 HEAD  
git log --reverse -1  

**Grep**  
git log --grep="xxx"  

**List of specific commit's files**  
git show --pretty=oneline --name-only <commit_id>  

PUSH
----
**push specific commit**  
git push -u origin commit_hash:main

**on specific remote**  
git push other_repo HEAD:main  

REBASE
------
**Rebase branch with conflict in main favor**  
git rebase main -s recursive -X theirs  

**From root interactive**  
git rebase --root -i
    
**Only last 2 commits**
git rebase HEAD^2 --onto <newbase>   

RESET & REVERT
--------------
git reset fichier1 fichier2 rep1 ... 
git revert <commit>  
git reset --hard origin/HEAD
    
SHOW
----
**List of author of last 5 commits**  
git show -s --format="%ae" $(git rev-list -5 --all)  
    
TRACKING
--------
git add -f <ignored_file>  
git rm --cached <file_to_ignore> 

TAG
---
git tag -a CN18.1.0.2 -m CN18.1.0.2  
git push origin --tags  
git tag -d mon_tag      # (delete)  
git push origin --delete mon_tag    # (delete remote)  
git fetch origin "+refs/tags/*:refs/tags/*"     # (recupère les tags supprimés du distant)

Ref
---
* https://gist.github.com/mpeshev/9550375
* https://gist.github.com/PaulCapestany/cebfbd54b0c25b6bd8b9
* https://gist.github.com/chrismccoy/8775224

**Git to changelog**  
* http://git.savannah.gnu.org/gitweb/?p=gnulib.git;a=blob_plain;f=build-aux/gitlog-to-changelog
