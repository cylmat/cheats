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
