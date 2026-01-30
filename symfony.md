### Default environment variables

```
parameters:
      env(BUILD_VERSION): 'default value'
      env(CONTENT_DIRECTORY): ~

      # use
      api_version: '%env(BUILD_VERSION)%'
```

### Form validation

```
ENTITY
 * @UniqueEntity(fields={"contract", "key"}, message="key already in use for this contract.")

CONTROLLER
        $contractMetadata = (new ContractMetadata())->setContract($contract);
        $contract->addContractMetadata($contractMetadata);

// set entity before form->submit()
        $form = $this->createForm(ContractMetadataType::class, $contractMetadata);
        $form->submit($data);
```

with api,  Symfony Forms cannot strictly validate JSON structure.

```
"status": {
  "idblop1": "inProgress", //ignored with "allow_extra_fields")
  "label": "inProgress"
}

Why NotNull is not triggered❗ Not submitted ≠ null Since id is not submitted at all, Symfony never calls:
required=true does NOT mean “required in JSON”
so "status": { "label": "inProgress" } is submitted, id is not present so is valid

* Solution (BEST) — Stop using Forms for APIs

class Status {
    #[Constraints\NotBlank()]
    public string $id;

    #[Constraints\NotBlank()]
    public string $label;
}

KEY VALIDATION! :
  $data = $serializer->deserialize( $request->getContent(), RequestStatus::class, 'json' ); 
  $form->submit($data, true);
```

### Query as boolean

```
// called from http://myurl?booleanQuery=false
$myquery = json_decode($request->query->get('booleanQuery')); // json_decode evaluate boolean value on string
```

### Services

Constants in services.yml
```
@https://symfony.com/doc/current/components/yaml.html
parameters:
    # this is considered a regular string
    foo: PHP_INT_MAX
    # starting from Symfony 3.4, use this syntax instead:
    bar: !php/const PHP_INT_MAX
```

mock http client for tests
```
 services:
    _defaults:
        autowire: true
        autoconfigure: true
        public: true

    App\Importer\AdvIndicatorValueImporter:
        arguments:
            $wasteApi: '@fixtures.http_client.mock'

    fixtures.http_client.mock:
        class: Symfony\Component\HttpClient\MockHttpClient
        factory: ['App\DataFixtures\Factory\MockHttpClientFactory', 'create']
```


### Error

Toolbar debug display :
- Response must be HTML
- have X-Debug-Token from Profiler.php
- (warning: fos_rest_bundle change format to json)
