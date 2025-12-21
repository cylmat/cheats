
WORKS BY OBJECT REFERENCE ! AND NOT BY ID
```
# [ MapEntity ] Entity $object
$object->setData('data1');

$object2 = $entityManager->getObject();
$object2->getData() === 'data1';
```

### Associations

@https://www.doctrine-project.org/projects/doctrine-orm/en/3.2/reference/association-mapping.html
```
---------------
Many To One UNI
(Many Users have One Address)

#[ManyToOne(targetEntity: Address::class)]
#[JoinColumn(name: 'address_id', referencedColumnName: 'id')]
private Address|null $address = null;

--------------
One To One UNI
(Product that references one Shipment)

#[OneToOne(targetEntity: Shipment::class)]
(optional)#[JoinColumn(name: 'shipment_id', referencedColumnName: 'id')]
private Shipment|null $shipment = null;

-------------
One To One BI
(One Customer <=> One Cart)

CUSTOMER
#[OneToOne(targetEntity: Cart::class, mappedBy: 'customer')]
private Cart|null $cart = null;

CART
#[OneToOne(targetEntity: Customer::class, inversedBy: 'cart')]
(optional)#[JoinColumn(name: 'customer_id', referencedColumnName: 'id')]
private Customer|null $customer = null;

--------------
One To Many UNI (with reference table) or BI (without)
(the "many" side in a one-to-many association holds the foreign key)
(mappedBy attribute on the "one" side and the inversedBy attribute on the "many" side)
(no difference between a bidirectional one-to-many and a bidirectional many-to-one)

PRODUCT
(One product has many features. This is the inverse side.)
#[OneToMany(targetEntity: Feature::class, mappedBy: 'product')]
private Collection $features;

FEATURE
(Many features have one product. This is the owning side.)
#[ManyToOne(targetEntity: Product::class, inversedBy: 'features')]
#[JoinColumn(name: 'product_id', referencedColumnName: 'id')]
private Product|null $product = null;
```

### cache

```
--- doctrine.yaml:
doctrine:
    orm:
        metadata_cache_driver:
            type: pool
            pool: doctrine.system_cache_pool

-- in index.php:
      if ('prod' === $kernel->getEnvironment()) {
            $kernel = new HttpCache($kernel);
      }
      
-- in Controller:
      return (new JsonResponse($responseData))->setPublic()->setMaxAge(3600);
      
-- in Entity.php
 /* @ORM\Table(name="intervention",indexes={
 *     @Index(name="filter_type", columns={"type_id"}),
 *     @Index(name="filter_standard", columns={"standard_id"})
 */
 
/**
 * @ORM\ManyToMany(targetEntity="Entity", inversedBy="interventions", cascade={"persist", "remove"}, fetch="EXTRA_LAZY")
 */
```

### DQL

command line
```
Select c from App\Entity\Category as c where c.id = 48
```

criteria
```
$criteria = Criteria::create()
    ->where(Criteria::expr()->eq('type', $type))
    ->andWhere(Criteria::expr()->isNull('isSimplified'))
    ->orWhere(Criteria::expr()->eq('isSimplified', 0));

$administrativesDivisions = $this->entityManager->getRepository(AdministrativeDivision::class)->matching($criteria);
```

expression
```
$qb = $this->createQueryBuilder('n');
$qb
->where($qb->expr()->in('n.contract', ':contract'))
->setParameter('contract', $contractPortal);

return $qb->addOrderBy('n.date', 'DESC');
```

### SSL

```
doctrine:
    dbal:
        url: '%env(resolve:DATABASE_URL)%'
        options:
            !php/const:PDO::MYSQL_ATTR_SSL_CA: "/var/www/html/BaltimoreCyberTrustRoot.crt.pem"
```

### Uuid

```
use Ramsey\Uuid\Doctrine\UuidGenerator;
use Ramsey\Uuid\UuidInterface;

#[ORM\Entity(repositoryClass: AddressRepository::class)]
class Address
{
    #[ORM\Id]
    #[ORM\Column(type: 'uuid')]
    #[ORM\GeneratedValue(strategy: 'CUSTOM')]
    #[ORM\CustomIdGenerator(class: UuidGenerator::class)]
    private UuidInterface $id;
```

```
//Fixtures
//---ramsey
$uuidValue = $defaultUuidValue ?? (new UuidGenerator())->generateId($manager, $entity)->toString();
$uuid = (new UuidFactory())->fromString($uuidValue);

$metadata = $manager->getClassMetaData($entity::class);
$metadata->setIdGenerator(new AssignedGenerator());
$metadata->setFieldValue($entity, 'id', $uuid);
```

# Error

The metadata storage is not up to date, please run the sync-metadata-storage command to fix this issue
```
- soluce
must have url with exact serverVersion: 
DATABASE_URL=mysql://root:@127.0.0.1:3306/testtest?serverVersion=mariadb-10.4.11
```


----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------

# POST

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
