https://www.mongodb.com/fr-fr/products/tools/compass  

```
show dbs
show collections

db.request_table.find({})

db.collection.find({"name":"Rayed"})
db.collection.updateOne({"name":"Rayed"}, {"name":"Fred", $unset: "verified"})
```
