- tips
 !! Caution !! #[MapEntity] with Symfony form on Update 
-> is reference and modify repository fetched objects with $form->handleRequest($request)

WORKS BY OBJECT REFERENCE ! AND NOT BY ID
```
# [ MapEntity(mapping: ['objectId' => 'id']) ] Entity $object
$object->setData('data1');

$object2 = $entityManager->getObject();
$object2->getData() === 'data1';
```

-----------soluce (clone) 
// Cloning avoid to update instantly doctrine object to later add validation in manager

```
USE $form = $this->createForm(IndicatorSourceFormType::class, clone $indicatorSource);
or
$em->detach($entity)
```

# POST DATA

### use object or id

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
```

------------- soluce: 
in Form Builder:  use  EntityType::class ->  "select field" to convert id to object
```
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


### TO AVOID UPDATE child entity (for exemple a referential)

// if static referential is updated instead of child data
```
 private function copyCurrentDataToUpdatedObject(Industrial $updatedIndustrial): void
 {
     $metadata = $updatedIndustrial->getIndustrialMetadata();
     foreach ($metadata as $key) {
         $metadata[$key]->setIndustrial($updatedIndustrial);

        // SET A NEW "indicator" instead of update current one (so doesn't update it)
         $existingIndicator =  $this->indicatorManager->getIndicator( $metadata[$key]->getIndicator() );
         $metadata[$key]->setIndicator($existingIndicator);
         $this->entityManager->persist($metadata[$key]);
     }
 }

private function copyCurrentContactsIntoUpdatedSite(Industrial $updatedIndustrial): void
{
     $updatedIndustrial->getIndustrialDescription()->setContacts(new ArrayCollection()); // EMPTY ENTITY VALUES

     $contacts = $this->contactManager->getContacts($updatedIndustrial->getId())->getArrayResult(); 
     foreach ($contacts as $contact) {
         if ($object = $this->contactManager->getById($contact['id'])) {
             $contact = clone $object; // MANDATORY to avoid reference conflict
             $this->entityManager->persist($contact); // add existing contact
             $updatedIndustrial->addContact($contact);
         }
     }
}
```

