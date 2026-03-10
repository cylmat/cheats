to see throught a list a json elements: 
```
kubectl get pods -o json | from json | get items | get 0 | get spec | column
```

to filter elements 
```
kubectl get pods -o json | from json | get items | where status.phase != 'Running' 
```

### JQ sample

get item name where "Tomato" is inside data list
```
[
  {
    "name": "first",
    "data": {
      "ingredients": [
        "Pizza dough",
        "Tomato sauce",
        "Fresh mozzarella"
      ]
    }
  },
  {
    "name": "second",
    "data":{
      "ingredients": [
        "Tofu, cubed",
        "Broccoli florets",
        "Carrots, sliced"
      ]
    }
  }
]

cat /tmp/test.json
| from json
| where {|r| ($r.data.ingredients | any { |i| $i == "Tomato sauce" }) }
| get name
'

# (detailed)
where {
    |r| (
          $r.data.ingredients | any {
                |i| $i == "Tomato sauce"
           }
     )
}
```
