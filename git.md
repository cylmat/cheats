# GIT

ref
- https://www.conventionalcommits.org/en/v1.0.0/#summary  
- https://commitlint.js.org/reference/rules  (https://github.com/conventional-changelog/commitlint)  


```
    get all conflict files

grep -lr '<<<<<<<' .

    resolve conflict with current branch code

git checkout --ours PATH/FILE

    do this with multiple files

grep -lr '<<<<<<<' . | xargs git checkout --ours
```

### worktrees

```
api-recettes/                  (dépôt principal, branche main)
    .trees/
      fix-auth-401/                (agent Claude Code)
      pagination-v2/                (agent Cursor)
      tests-integration/            (agent Codex CLI)
```
