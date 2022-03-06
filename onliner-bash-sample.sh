# Sample

tail file | awk '{d=$1} sub(/.*{/,""){$0="{\"date\": \""d"\", " $0} 1' | jq -r '.date + " " + .log'

# ---
# @ref: 
- https://www.bashoneliners.com
- https://www.commandlinefu.com
