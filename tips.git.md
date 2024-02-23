PREVIOUS_BRANCH=`git rev-parse --abbrev-ref HEAD -- | head -n 1`
NEW_RELEASE=`git branch --all | grep -o '\(release\|hotfix\)/[0-9]*\.[0-9]*\.[0-9]*' | sort -V | tail -n 1 |  awk -F'[/.]' '{print "release/"$2"."$3"."$4+1}'`
git submodule foreach sh -c 'git pull'
