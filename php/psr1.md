#
# PSR1
#

- Files MUST use only <?php and <?= tags.  
- Files MUST use only UTF-8 without BOM for PHP code.  
- Files SHOULD either declare symbols (classes, functions, constants, etc.) or cause side-effects (e.g. generate output, change .ini settings, etc.) but SHOULD NOT do both.  
- Namespaces and classes MUST follow an "autoloading" PSR: [PSR-0, PSR-4].  
- Class names MUST be declared in StudlyCaps (PascalCase).  
- Class constants MUST be declared in all upper case with underscore separators.  
- Method names MUST be declared in camelCase.  

```
<?php
// PHP 5.3 and later:
namespace Vendor\Model;

class Foo
{
    const VERSION = '1.0';
    const DATE_APPROVED = '2012-06-01';

    $StudlyCaps, $camelCase, or $under_score;

    function camelCase() 
    {
    }
}
```

#
# PSR12 - Extended Coding Style
#

2. General
- Use LF only
- Php file MUST end with non-blank line LF
- ?> MUST be omitted tag for php-only files
- NO hard limit, Soft MUST be 120 length, 80 line length recommanded
- No end line trailing spaces
- MUST be 4 spaces indent
- Reserved words short and lowercase (ex: bool, int)

3. Namespace, imports
- Opening <?php tag.
- File-level docblock.
- One or more declare statements.
- The namespace declaration of the file.
- One or more class-based use import statements.
- One or more function-based use import statements.
- One or more constant-based use import statements.
- The remainder of the code in the file.

4. Class properties
- Parentheses MUST always be present: new Foo();
- extends and implements keywords MUST be declared on the same line as the class name.
- use keyword used inside the classes to implement traits MUST be declared on the next line after the opening brace
- Visibility MUST be declared on all properties

5. Control Structures
6. Operators
7. Closures


```
<?php

/**
 * Docblock
 */

declare(strict_types=1);
declare(ticks=1) {
    // some code
}

namespace Vendor\Package;

use Vendor\Package\{ClassA as A, ClassB, ClassC as C};
use Vendor\Package\SomeNamespace\ClassD as D;

use Vendor\Package\SomeNamespace\{
    SubnamespaceOne\ClassA,
    SubnamespaceOne\ClassB,
    SubnamespaceTwo\ClassY,
    ClassZ,
};

use function Vendor\Package\{functionA, functionB, functionC};

use const Vendor\Package\{ConstantA, ConstantB, ConstantC};

class Foo extends Bar implements FooInterface
{
    use FirstTrait; // traits on first line of class
    use SecondTrait;
    use C {
        B::bigTalk insteadof C;
        C::mediumTalk as FooBar;
    }

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
