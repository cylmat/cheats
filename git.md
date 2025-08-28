```
    get all conflict files

grep -lr '<<<<<<<' .

    resolve conflict with current branch code

git checkout --ours PATH/FILE

    do this with multiple files

grep -lr '<<<<<<<' . | xargs git checkout --ours
```
