ref  
- https://jqlang.github.io/jq/
- https://www.baeldung.com/linux/jq-command-json

```
jq -R '{questions: [inputs | split(",") | {item: .[0], task: .[1]}]}' < test1.csv

curl 'https://dummyjson.com/recipes?limit=3&select=' > /tmp/json_recipes  
curl 'https://api.github.com/repos/jqlang/jq/commits?per_page=5' | jq '.[0]'    

cat file.json | jq '.'  <=>   jq "." < file.json  <=>  jq "." file.json  

# Usage:
# -c(ompact) -n(ull value)
# -arg a v (arg $a to value v)
echo '{"foo":0}' | jq .                          - {"foo":0}
echo '{"foo":"res"}' | jq .foo                   - "res"
echo '[{"foo":"res"},{"two":"net"}]' | jq '.[1]' - {"two":"net"}

export FOOBAZ=5
jq --arg alpha "$FOOBAZ" '{"foobaz":$alpha}'
jq --arg "name1" "value1" --arg "name2" "value2" '. + $ARGS.named'
```

```
JSON = { "recipes": [
    {"id": 33, "name": "Margherita", "ingredients": ["salt", "pepper"]},
    {"id": 55, "name": "Stir", "ingredients": ["tomato", "mozza", "fresh basil", "ananas"]}
] }
```

# DISPLAY
```

jq '.recipes[] .id'                    => 33 55
jq '.recipes[] | .id'                  => 33 55
jq '.recipes[1].ingredients'           => ["tomato", "mozza", "fresh basil", "ananas"]
jq '.recipes[1].ingredients | .[1:4]'  => ["tomato, mozza, fresh basil"]
jq '. | length'  => 2

# entries (k => v) / map (val)
jq '.recipes | to_entries'                         =>  [{"key": 0, "value": {"id": 33 ...}}, {"key": "1", "value": {"id": 55 ... }}]
jq '.recipes[0] | to_entries | .[] | "\(.key)" '   => "id" "name" "ingredients"

jq  '.recipes |  map(.name)'       => ["Margherita", "Stir"]
jq  '.recipes | map({name, id})'   => [{"name":"Margherita","id":33},{"name":"Stir-Fry","id":55}]
echo "[33,55]" | jq  'map(.) '     =>  [33,55]
echo "[33,55]" | jq  'map([.]) '   =>  [[33],[55]]
echo '[{"id": 5},{"id": 18}]' | jq 'map(.id+1)'

jq --(s)lurp '.' file1 file2       =>   [{"recipes": {...}, {"recipes": {...}]

# with_entries(f)  <=>  to_entries | map(f) | from_entries
echo { "b": "beta", "a": "alpha" } | jq -c 'to_entries' =>  [{"key":"b","value":"beta"},{"key":"a","value":"alpha"}]
echo '[{ "key": "beta", "value": "alpha" }]' | jq -c 'from_entries'   {"beta":"alpha"}
echo '{"a": 1, "b": 2}'  | jq -c 'with_entries(.key |= "KEY_" + .)'  => {"KEY_a":1,"KEY_b":2}
```

# SPECIFIC

```
# select (null/regexp) / group / sort
jq '.recipes[] | select(.id == 33)'                 => {"id": 33,"name": "Margherita"}
jq  '.recipes[] | select(.name? | match("Mar.+"))'  => {"id": 33,"name": "Margherita"}

jq '.recipes | group_by(.rating > 30)'              => [{"id": 33,"name": "Margherita"}, {"id": 55,"name": "Stir"}]
jq '.recipes | sort_by(.rating) | reverse'          =>    [{"id": 55, "rating":4}, {"id": 33, "rating":"3}]
jq '.recipes[0].ingredients | unique | sort'
```

# CHANGE

```
# to object
jq '.recipes[] | {n: .id, o: .name}'   => {"n": 33,"o": "Margherita"}, {"n": 55,"o": "Stir"}
jq '.recipes[0] | {n: .id, o: .name}'  => {"n": 33,"o": "Margherita"}

# = / + / add / del
jq '.recipes[1] | .name="newone"'                        =>  {"id": 55,"name": "newone"}
jq '.recipes | map(.name) | add'                         =>   "MargheritaStir"
jq '.recipes[0].ingredients[0] +"#"+ .recipes[0].ingredients[1]'    => "salt#pepper"
jq  '.recipes[0].ingredients + .recipes[1].ingredients'  =>  ["salt", "pepper", "tomato"]
jq '.recipes[1] | del(.id)'                              =>  {"name": "Margherita"}

# csv
cat json | jq -r ".recipes[] | [.name, .id] | @csv" > file.csv

# string interpolation with "\(.field) \(.field2)"
jq '.recipes[0] | {ref: 9, account: "\(.id) \(.name)"}' => { "ref": "9", "account": "33 Margherita" }

jq  '(.recipes | map(.name) | unique | sort) as $cols | (.recipes | map(.id)) as $row |  $cols | map($row[.]) | @csv' json
```
