Yaml
====
**Merge and reuse**  
```
checkout_top: &checkout
    - 'get_cart'
checkout_summary:
    <<: *checkout
checkout_slot:
    <<: *checkout
```
