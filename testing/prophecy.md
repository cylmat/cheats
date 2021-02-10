# Prophecy 
https://phpunit.readthedocs.io/fr/latest/test-doubles.html

```
use PHPUnit\Framework\TestCase;
use Prophecy\Argument;
MyText extends TestCase { ...

$fakeClass = $this->prophesize(\Real\Class::class);
$fakeClass->myFunction( 
    Argument::cetera(),
    Argument::any()
)
->shouldBeCalled()
->willReturn(8);

$returnFakeFct = $fakeClass->reveal();

$classToTest = new \Class\To\Test($fakeOne->reveal(), $fakeTwo->reveal());
$this->assertInstanceOf(\ReturnedClass::class, $classToTest->functionToTest($fakeClass->reveal()));
```

### ex:
$fakeClass->myFunction( 3 )->willReturn(new \Another\Real\Class);

### tips
$fakeClass = $this->prophesize(\MyClass::class) : Prophecy\Prophecy\ObjectProphecy 
$fakeClass->reveal() : Double\Namespace\To\My\Class\P1


## PROPHECY
willExtend() willImplemen(t) willBeConstructedWith() reveal()
addMethodProphecy() getMethodProphecies() makeProphecyMethodCall()
findProphecyMethodCalls() checkProphecyMethodsPredictions()

Argument::is($value) ::exact($value) ::type($typeOrClass) ::which($method, $value) 
    ::that(callback) ::any() ::cetera() ::containingString($value) - checks that the argument contains a specific string value
CallPrediction or shouldBeCalled()  shouldNotBeCalled()  shouldBeCalledTimes($count)  should($callback) -
