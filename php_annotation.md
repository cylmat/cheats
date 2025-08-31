doctrine
```
use Doctrine\ORM\Mapping as ORM;
@https://www.doctrine-project.org/projects/doctrine-orm/en/2.14/reference/annotations-reference.html

use Gedmo\Timestampable\Traits\TimestampableEntity;
@https://github.com/doctrine-extensions/DoctrineExtensions

use JMS\Serializer\Annotation as JMS;
@https://jmsyst.com/libs/serializer/master/reference/annotations

use Ramsey\Uuid\UuidInterface;
@https://github.com/ramsey/uuid-doctrine

use Swagger\Annotations as SWG;
@https://zircote.github.io/swagger-php/reference/annotations.html

use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;
@https://symfony.com/doc/current/reference/constraints.html

use Symfony\Component\Validator\Constraints as Assert;
```

sample attributes
- https://github.com/zircote/swagger-php

```

### zircote object

#[OA\Parameter(
        name: 'geojson',
        in: 'query',
        required: false,
        description: 'GeoJSON location filter (e.g., geojson[latitude]=5.123&geojson[longitude]=2.1231564)',
        style: 'deepObject',
        explode: true,
        schema: new OA\Schema(
            type: 'object',
            properties: [
                new OA\Property(property: 'latitude', type: 'number', format: 'float'),
                new OA\Property(property: 'longitude', type: 'number', format: 'float'),
            ]
        )
    )]
    public function getAllAction(Request $request)
    {
        $geojson = $request->query->all('geojson');
/* 
['longitude'=>2.1231564, 'latitude' => 5.123] 
*/

// or

 #[OA\Parameter(
        name: 'geojson[ longitude ]',
        in: 'query',
        description: 'request in this geojson longitude',
        required: false,
        schema: new OA\Schema(type: 'array', items: new OA\Items(type: "string"))
    )]
```

sample
```
use FOS\RestBundle\Controller\Annotations as FOS;
use Nelmio\ApiDocBundle\Attribute\Model;
use OpenApi\Attributes as OA;

#[FOS\Get(path: "/api/contract")]
#[OA\Get( summary: "Get all contract" )]
#[OA\Parameter(
      name: "filter[q]",
      in: "query",
      description: "search in label",
      required: false,
      schema: new OA\Schema(type: "array", items: new OA\Items(type: "string"))
)]
#[OA\RequestBody(
        required: true,
        description: 'Area',
        content: new OA\JsonContent(ref: '#/components/schemas/Area')
    )]
#[OA\Response(
      response: 200,
      description: "Returned when all data",
      content: new OA\JsonContent(ref: new Model(type: Contract::class))
)]
```

annotations
```
/**
   * @Route("/api/request/{requestTypeId}/{schemaType}", methods={"GET"}, name="get_request_schema")
   *
      @OA\Get( summary="Get request type schema" ) // to  remove  
    
   * @OA\Parameter(
   *     in="path",
   *     name="requestTypeId",
   *     description="Status list",
   *     @OA\Schema(
   *         type="string",
   *         enum= {"ui-schema", "workflow-step-schema", "detail-screen-schema"}
   *     )
   * )
   * @OA\Response(
   *     response=200,
   *     description="Request type schema"
   * )
   * @OA\Response(
   *     response=404,
   *     description="Request type schema not found"
   * )
   * @OA\Tag(name="RequestTypeDefinition")
   */
    
    use Nelmio\ApiDocBundle\Annotation\Model as Model;
    /**
   * @Route("/api/requestTypeDefinition/{requestTypeId}/{schemaType}", methods={"PUT"}, name="put_request_schema")
   *        
   * @OA\Parameter(
   *     in="path",
   *     name="requestTypeId",
   *     description="Status list",
   *     @OA\Schema(
   *         type="string",
   *         enum= {"ui-schema", "workflow-step-schema", "detail-screen-schema"}
   *     )
   * )
   * @OA\RequestBody(
   *     request="schema",
   *     description="Request type schema",
   *     @Model(type=RequestTypeUISchema::class)
   * )
   * @OA\Response(
   *     response=200,
   *     description="UI schema updated"
   * )
   * @OA\Response(
   *     response=400,
   *     description="Json error format"
   * )
   * @OA\Tag(name="RequestTypeDefinition")
   */
```
