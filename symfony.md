### Default environment variables

```
parameters:
      env(BUILD_VERSION): 'default value'
      env(CONTENT_DIRECTORY): ~

      # use
      api_version: '%env(BUILD_VERSION)%'
```

### Query as boolean

```
// called from http://myurl?booleanQuery=false
$myquery = json_decode($request->query->get('booleanQuery')); // json_decode evaluate boolean value on string
```

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
