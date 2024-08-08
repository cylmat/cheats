### Credentials

git config --global credential.helper 'store --file ~/.my-credentials'

### Search
  
Search in all files : git rev-list --all | xargs git grep -F '<Your search string>'

### Misc

```
PREVIOUS_BRANCH=`git rev-parse --abbrev-ref HEAD -- | head -n 1`    
NEW_RELEASE=`git branch --all | grep -o '\(release\)/[0-9]*' | sort -V | tail -n 1 | awk -F'[/.]' '{print "release/"$2"."$3"."$4+1}'`   
```

### Submodules

```
git submodule init
git submodule update --init --recursive
git submodule foreach sh -c 'git pull'  
```

### Worktree

Remove untracked changes : git clean -f -d
