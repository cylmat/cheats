#
# PSR1
#

Files MUST use only <?php and <?= tags.  
Files MUST use only UTF-8 without BOM for PHP code.  
Files SHOULD either declare symbols (classes, functions, constants, etc.) or cause side-effects (e.g. generate output, change .ini settings, etc.) but SHOULD NOT do both.  
Namespaces and classes MUST follow an "autoloading" PSR: [PSR-0, PSR-4].  
Class names MUST be declared in StudlyCaps.  
Class constants MUST be declared in all upper case with underscore separators.  
Method names MUST be declared in camelCase.  

```
<?php
// PHP 5.3 and later:
namespace Vendor\Model;

class Foo
{
  const VERSION = '1.0';
  const DATE_APPROVED = '2012-06-01';

  $StudlyCaps, $camelCase, or $under_score;

  function camelCase() {
  }
}
```

#
# PSR12
#

```
<?php

declare(strict_types=1);

namespace Vendor\Package;

use Vendor\Package\{ClassA as A, ClassB, ClassC as C};
use Vendor\Package\SomeNamespace\ClassD as D;

use function Vendor\Package\{functionA, functionB, functionC};

use const Vendor\Package\{ConstantA, ConstantB, ConstantC};

class Foo extends Bar implements FooInterface
{
    public function sampleFunction(int $a, int $b = null): array
    {
        if ($a === $b) {
            bar();
        } elseif ($a > $b) {
            $foo->bar($arg1);
        } else {
            BazClass::bar($arg2, $arg3);
        }
    }

    final public static function bar()
    {
        // method body
    }
}
```

## PSR2 (deprecated)

Code MUST follow a "coding style guide" PSR [PSR-1].  
Code MUST use 4 spaces for indenting, not tabs.  
There MUST NOT be a hard limit on line length; the soft limit MUST be 120 characters; lines SHOULD be 80 characters or less.  
There MUST be one blank line after the namespace declaration, and there MUST be one blank line after the block of use declarations.  
Opening braces for classes MUST go on the next line, and closing braces MUST go on the next line after the body.  
Opening braces for methods MUST go on the next line, and closing braces MUST go on the next line after the body.  
Visibility MUST be declared on all properties and methods; abstract and final MUST be declared before the visibility; static MUST be declared after the visibility.  
Control structure keywords MUST have one space after them; method and function calls MUST NOT.  
Opening braces for control structures MUST go on the same line, and closing braces MUST go on the next line after the body.  
Opening parentheses for control structures MUST NOT have a space after them, and closing parentheses for control structures MUST NOT have a space before.  
