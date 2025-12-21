```
    Doctrine tracks by object identity, not by data.
    clone in PHP is shallow by default → only top-level properties are copied.
    Always deep-clone relations when you want to avoid auto-flushes.
    Alternatively, detach the entity to break Doctrine’s tracking.
```

- tips

 !! Caution !!   
 #[MapEntity] with Symfony form on Update    
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

## Deep cloning

 Doctrine clone and detach only detach FIRST LEVEL, not child objects
```
e.g. 
IndicatorSource
    IndicatorSubjects[]

To avoid form and 
 #[MapEntity(mapping: ['indicatorSourceId' => 'id'])] IndicatorSource $indicatorSource,
to instantly update entity children when submitting form, use

IndicatorSource
    public function __clone()
    {
        $this->id = null; // reset id for cloned entity

        // Deep clone of indicatorSubjects
        $clonedSubjects = new ArrayCollection();
        foreach ($this->indicatorSubjects as $subject) {
            $clonedSubject = clone $subject;
            $clonedSubject->setIndicatorSource($this);
            $clonedSubjects->add($clonedSubject);
        }
        $this->indicatorSubjects = $clonedSubjects;
    }
```

## Form

ChoiceType(Doctrine) vs EntityType(Symfony)
```
EntityType is special — it talks directly to Doctrine.
It loads choices using the repository, and when the form is submitted, it automatically replaces the value with a managed entity from Doctrine (via its ID or other identifier).
So EntityType → managed object
Custom form type → new object (unless you intervene)
-----

If you really want to use your own sub-form instead of EntityType, you must ensure it loads the existing entity instead of creating a new one.
There are a few ways to do this:
🧩 Option A: Use a DataTransformer inside your custom form type
Option B: Handle it in your controller or form handler
```

## VALIDATION Manager

```
*** Doctrine's UniqueEntity(multiple fields) FAILED !!
------ soluce: use manager validation

 private function validateUniqueEntity(Industrial $clonedIndustrial): void
 {
     foreach ($this->industrialRepository->fetchAll() as $exist)
         if ( $exist->getName() === $name = $clonedIndustrial->getName() )
             throw new \Exception("Entity with name '$name' already exists"); 
 }
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

ex1
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
```

ex2
```
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

ex3
```
   // doesn't works (object is collection empty)
   $contractMetadatas = clone $contract->getContractMetadatas();
   $contract->setContractMetadatas(new ArrayCollection);
   $this->entityManager->persist($contract);
   $contract->setContractMetadatas($contractMetadatas);
   $this->entityManager->persist($contract);
   $this->entityManager->flush();

   // use collection full, clone each object
   $contractMetadatas = new ArrayCollection;
   foreach ($contract->getContractMetadatas() as $contractMetadata) {
      $contractMetadatas->add(clone $contractMetadata);
   }
   $contract->setContractMetadatas(new ArrayCollection);
   $this->entityManager->persist($contract);
   $contract->setContractMetadatas($contractMetadatas);
   $this->entityManager->persist($contract);
   $this->entityManager->flush();
```
