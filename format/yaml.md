Yaml
====
**Merge and reuse**  
```
che_top: &checkout
    - 'cart1'
    - 'cart2'
che_summary:
    <<: *checkout
che_slot:
    <<: *checkout
```

https://yaml.org/type/merge.html
