# PSR

[php-fig.org/psr]

12 - Extended Coding Style

    LF only
    End with non-blank line
    Non ending tag for php-only files
    80 line length recommanded (avoid 120+)
    4 spaces
    reserved words short and lowercase (ex: bool, int)
    <?php alone on single line

```
Class declaration
<?php

/**
* This file contains an example of coding styles.
*/

declare(strict_types=1);

namespace Vendor\Package;

// class-based use import statements
use Vendor\Package\{ClassA as A, ClassB, ClassC as C};
use Vendor\Package\SomeNamespace\ClassD as D;
use Vendor\Package\SomeNamespace\{
    ### SubnamespaceOne\AnotherNamespace\ClassA, // INCLUDED NAMESPACE NOT ALLOWED !
    SubnamespaceOne\ClassA,
    ClassZ,
};

// function import
use function Vendor\Package\{functionA, functionB, functionC};

// const import
use const Vendor\Package\{CONSTANT_A, CONSTANT_B, CONSTANT_C};

/**
* Example class DocComment.
*/
class Foo extends \Bar implements \FooInterface // same line
{
    use FirstTrait; // traits on first line of class
    use SecondTrait;
    use C {
        B::bigTalk insteadof C;
        C::mediumTalk as FooBar;
    }

    // always declare visibility
    public $foo = null;
    public static int $bar = 0;
    private $property;

    // ... constants, properties, methods ...
    abstract protected function zim();

    // default values at the end of arguments list
    final public static function bar(?int $arg1, &$arg2, &...$parts, $arg3 = []): ?string
    {
        // ... method body ...

        new Foo(); // declare class always with ()
        return 'string';
    }

    public function aVeryLongMethodName(
        ClassTypeHint $arg1,
        &$arg2,
        array $arg3 = []
    ): ?string {
        // method body
        return 'string';
    }

    ### private _foo() // "_" NOT ALLOWED !
}

class Foo extends \Bar implements // multiple lines
    \ArrayAccess,
    \Countable,
    \Serializable
{

<?php declare(strict_types=1) ?>
<?php
    declare(ticks=1) {
        // some code
    }
?>
<html>
<body>
    <?php
        // ... additional PHP code ...
    ?>
</body>
</html>

Functions call
bar();
$foo->bar($arg1);
Foo::bar($arg2, $arg3);

$foo->bar(
    $longArgument,
    $longerArgument,
    $muchLongerArgument
);

somefunction($foo, $bar, [
  // ...
], $baz);

$app->get('/hello/{name}', function ($name) use ($app) {
    return 'Hello ' . $app->escape($name);
});

Control structures
if (
    $expr1
    && $expr2
) {
    // if body
} elseif (
    $expr3
    && $expr4
) {
    // elseif body
}

if ($a === $b) {
    bar();
} elseif ($a > $b) {
    $foo->bar($arg1);
} else {
    BazClass::bar($arg2, $arg3);
}
### "else if" with space NOT ALLOWED !

switch ($expr) {
    case 0:
        echo 'First case, with a break';
        break;
    case 1:
        echo 'Second case, which falls through';
        // no break
    case 2:
    case 3:
    case 4:
        echo 'Third case, return instead of break';
        return;
    default:
        echo 'Default case';
        break;
}

switch (
    $expr1
    && $expr2
) {
    // structure body
}

while (
    $expr1
    && $expr2
) {
    // structure body
}

do {
    // structure body;
} while ($expr);

do {
    // structure body;
} while (
    $expr1
    && $expr2
);

for ($i = 0; $i < 10; $i++) {
    // for body
}

for (
    $i = 0;
    $i < 10;
    $i++
) {
    // for body
}

foreach ($iterable as $key => $value) {
    // foreach body
}

try {
    // try body
} catch (FirstThrowableType $e) {
    // catch body
} catch (OtherThrowableType | AnotherThrowableType $e) {
    // catch body
} finally {
    // finally body
}

/**
* OPERATORS
*/
$intValue = (int) $input;

$i++;

if ($a === $b) {
    $foo = $bar ?? $a ?? $b;
} elseif ($a > $b) {
    $foo = $a + $b * $c;
}

$variable = $foo ? 'foo' : 'bar';
$variable = $foo ?: 'bar';

Closures & class
$closureWithArgsVarsAndReturn = function ($arg1, $arg2) use ($var1, $var2): bool {
    // body
};

$longArgs_longVars = function (
    $longArgument,
    $longerArgument,
    $muchLongerArgument
) use (
    $longVar1,
    $longerVar2,
    $muchLongerVar3
) {
  // body
};

$foo->bar(
    $arg1,
    function ($arg2) use ($var1) {
        // body
    },
    $arg3
);

$instance = new class {};

// Brace on the same line
$instance = new class extends \Foo implements \HandleableInterface {
    // Class content
};

// Brace on the next line
$instance = new class extends \Foo implements
    \ArrayAccess,
    \Countable,
    \Serializable
{
    // Class content
};
```
