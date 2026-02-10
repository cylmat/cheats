GIT - ONE PAGE CHEAT
===

## STATUS & INSPECTION
```
git status : Show branch, staged/unstaged files
git diff : Show unstaged changes
git diff --staged : Show staged changes
git log --oneline --graph --decorate --all : Compact commit graph
git show <commit> : Show commit details
git branch -vv : Branch info + tracking
git remote -v : Remote URLs
```

## QUICK ADD & COMMIT
```
git add <file> : Stage file
git add -A : Stage all changes
git commit -m "msg" : Commit changes
git commit --amend : Amend last commit
git commit --amend --no-edit: Amend without changing message
git reset <file> : Unstage file
git reset --soft HEAD~1 : Undo last commit (keep changes staged)
git reset --hard HEAD~1 : Undo last commit (discard changes)
```

## BRANCHING & NAVIGATION
```
git checkout <branch> : Switch branch
git checkout -b <branch> : Create + switch branch
git switch <branch> : Modern switch branch
git switch -c <branch> : Modern create + switch
git branch : List branches
git branch -a : List all branches
git branch -d <branch> : Delete branch
git branch -D <branch> : Force delete
git reflog : Track all HEAD movements
```

## MERGE / REBASE / CHERRY-PICK
```
git merge <branch> : Merge branch
git merge --no-ff <branch> : Explicit merge commit
git rebase <branch> : Rebase current onto branch
git rebase -i <commit> : Interactive rebase
git cherry-pick <commit> : Apply commit elsewhere
git reset --hard ORIG_HEAD : Abort merge/rebase
git mergetool : Launch merge tool
```

## REMOTE OPERATIONS
```
git fetch <remote> : Fetch updates
git pull : Fetch + merge
git pull --rebase : Fetch + rebase
git push <remote> <branch> : Push branch
git push -u <remote> <branch>: Set upstream
git push --force-with-lease : Safe force push
git remote add <name> <url> : Add remote
git remote rm <name> : Remove remote
```

## STASH & WIP MANAGEMENT
```
git stash : Stash changes
git stash save "msg" : Stash with message
git stash list : List stashes
git stash apply <stash> : Apply stash
git stash pop <stash> : Apply + drop
git stash drop <stash> : Delete stash
git stash branch <branch> : Create branch from stash
```

## TAGS & RELEASES
```
git tag : List tags
git tag <tag> : Create lightweight tag
git tag -a <tag> -m "msg" : Annotated tag
git push origin <tag> : Push tag
git push origin --tags : Push all tags
```

## LOG & SEARCH
```
git log --oneline --graph --decorate --all : Compact history
git log -S "string" : Search commits adding/removing string
git log -G "regex" : Search commits by regex
git log --author="Name" : Filter by author
git log --since="2 weeks ago" : Filter by date
git blame <file> : Line-by-line commit history
git diff <commit1> <commit2> : Diff between commits
```

## DAILY WORKFLOWS
```
# Quick commit
git add -A && git commit -m "msg" && git push

# Feature branch
git checkout -b feature

# make changes
git add .
git commit -m "feat: implement X"
git push -u origin feature

# Hotfix
git checkout master
git pull
git checkout -b hotfix

# fix
git commit -am "fix: bug"
git push origin hotfix
git checkout master
git merge hotfix
git push

# Rebase workflow
git fetch origin
git checkout feature
git rebase origin/master

# resolve conflicts if any
git rebase --continue
git push --force-with-lease

# Undo mistakes
git reset --soft HEAD~1 # undo last commit, keep changes staged
git reset --hard HEAD~1 # undo last commit, discard changes
git checkout -- <file> # discard changes in file
git reflog # recover lost commits
git cherry-pick <commit> # apply commit elsewhere
```

## USEFUL HACKS
- git log --oneline --graph --decorate --all → visualize commit tree
- git stash + git stash branch → experiment safely
- git commit --amend → fix last commit instantly
- git reset --soft HEAD~1 → undo safely
- git reflog → recover lost commits
- Combine with fzf: git log --oneline | fzf → checkout selected commit
- Interactive rebase: git rebase -i → rewrite history
- Force push safely: git push --force-with-lease
- Multi-step alias: git config --global alias.hist "log --oneline --graph --decorate --all"

