## Error
```
0% GitHub API limit (0 calls/hr) is exhausted, could not fetch https://api.github.com/repos... 
Review your configured GitHub OAuth token or enter a new one to go over the API rate limit. You can also wait until ? for the rate limit to reset.

Head to https://github.com/settings/tokens/new?scopes=repo&description=Composer+on+sample.hosting.net
to retrieve a token. It will be stored in "/home/dir/auth.json" for future use by Composer.
```
- https://github.com/settings/tokens
- composer config --auth github-oauth.github.com ghp_i[token]
