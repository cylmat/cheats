jq -R '{questions: [inputs | split(",") | {item: .[0], task: .[1]}]}' < test1.csv  
