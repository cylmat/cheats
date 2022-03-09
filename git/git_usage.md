


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
