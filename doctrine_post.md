- tips
 
WORKS BY OBJECT REFERENCE ! AND NOT BY ID
```
# [ MapEntity ] Entity $object
$object->setData('data1');

$object2 = $entityManager->getObject();
$object2->getData() === 'data1';
```



### POST DATA

- use object or id
```
POSTMan: {
    "id": "9e86188b-9b14-4bb3-9491-accf9c07f098",
    "indicatorSource": "2c228a42",
    "key": "siteCode1",
    "value": "MNP"
},
or {
     "id": "9e86188b-9b14-4bb3-9491-accf9c07f098",
     "indicatorSource": {
           "id": "2c228a42",
           "name": "JADE",
           "code": "DEDE",
           "frequencyType": { "code": "monthly", "name": "Monthly" }
     },
     "key": "siteCode1",
     "value": "MNP"
}

------------- soluce: 
in Form Builder:  use  EntityType::class ->  "select field" to convert id to object

$formBuilder
     ->add('key', TextType::class, ['label' => 'Key'])
     ->add('value', TextType::class, ['label' => 'Value'])
     ->add('indicatorSource', EntityType::class, [          
         'class' => IndicatorSourceType::class,
         'choice_name' => 'code',
         'choice_label' => 'name',
     ])
 ;

$formBuilder->addEventListener(FormEvents::PRE_SUBMIT,
     function (FormEvent $formEvent): void {
          $data = $formEvent->getData();
          if (is_array($data['indicatorSource'])) {
              $data['indicatorSource'] = $data['indicatorSource']['id'];
          }
          $formEvent->setData($data);
      });
```
