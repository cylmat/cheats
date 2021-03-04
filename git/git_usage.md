### BRANCH
#### CREATE
git checkout -b <branch> --track origin/<branch>

#### MODIFY or DELETE
git branch -m feature/OPFR-1234 feature/OPFR-4321  
git branch -D feature/OPFR-XXXX  
git push --delete origin feature/OPFR-XXXX  

### CONFIG
vim .git/info/exclude      # (exclude files)

### CLEAN - Remove untracked files & dirs
git clean -fd --dry-run --interactive  
    -x (dont use .gitignore) -e (exclude) <pattern>  
    -X (use .gitignore)

### COMMIT
git commit --amend -m '[OPFR-5694] Modification'    # (change last commit message)

### DIFF
git diff fichier1 fichier2 ...  
git difftool  
git diff branch_1 origin/branch_1

### FILESYSTEM
* In case of errors, or breaked HEAD  
git fsck --full

### LOG GREP
git log --grep="xxx"

### RESET & REVERT
git reset fichier1 fichier2 rep1 ... 
git revert <commit>  
git reset --hard origin/HEAD
    
### TRACKING
git add -f <ignored_file>
git rm --cached <file_to_ignore> 

### TAG
git tag -a CN18.1.0.2 -m CN18.1.0.2  
git push origin --tags  
git tag -d mon_tag      # (delete)  
git push origin --delete mon_tag    # (delete remote)  
git fetch origin "+refs/tags/*:refs/tags/*"     # (recupère les tags supprimés du distant)
