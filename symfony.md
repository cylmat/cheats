
### services

Constants in services.yml
```
@https://symfony.com/doc/current/components/yaml.html
parameters:
    # this is considered a regular string
    foo: PHP_INT_MAX
    # starting from Symfony 3.4, use this syntax instead:
    bar: !php/const PHP_INT_MAX
```

### Error

Toolbar debug display :
- Response must be HTML
- have X-Debug-Token from Profiler.php
- (warning: fos_rest_bundle change format to json)
