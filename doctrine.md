
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

### uuid

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
