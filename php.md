# Tips

## csv files & bom

see @https://csv.thephpleague.com/9.0/connections/bom  
```
with bom: "\xEF\xBB\xBF" (UTF-8)
fwrite($fw, "\xEF\xBB\xBF" . file_get_contents(__DIR__.'/local/export-with-bom.csv'));
```

### Dateinterval 

```
P[n]Y[n]M[n]DT[n]H[n]M[n]S   (ISO 8601 duration format)

(P start date, T start time)
new DateInterval ('PT24H')    -> 24 hours
```

## For loop : declare array
```
for ($l = array(1,1), $i = 2, $x = 0; $i < $length; $i++)
```

## map text as callback name:   
```
array_map('intval', preg_split('/ /', $arr_temp, -1, PREG_SPLIT_NO_EMPTY));
```

## Private
```
$clone {private $runtime}
public function change() {
   $clone = clone $clonable;
   $clone->runtime = $runtime; // we can access it since we are in Object scope
   return $clone;
}
```

## sscanf %[^<char>] Get an input without limits until <char>
```
sscanf("3 5 9 11 109 8\n", "%[^\n]", $arr_temp);
```

## Serializable::serialize vs __serialize

Serializable::serialize : the destructor is not called as a part of the object's serialization.
@see https://www.php.net/manual/en/language.oop5.magic.php#object.serialize

## sleep
```
_sleep : [prop1, prop2] vs __serialize : ['whatever'=>'whatever']
```

## Syntaxic sugar
```
[, $b, $c, 'd' => $d] = $array   
foreach ($array as ['id' => $id, 'name' => $name])     
variadic_func( ...$a )  
[$a[2],$a[3]] = [$a[3],$a[2]];   
preg_replace_callback
```

## Tests

bootstrap.php
```
// Mandatory to avoid Phpunit error
\Symfony\Component\ErrorHandler\ErrorHandler::register();

// Executes console command
$console = sprintf('APP_ENV=%s php %s', $_ENV['APP_ENV'], __DIR__.'/../bin/console');

passthru(sprintf('%s %s', $console, 'doctrine:schema:drop --force'));
passthru(sprintf('%s %s', $console, 'doctrine:query:sql "CREATE DATABASE IF NOT EXISTS database_test"'));
passthru(sprintf('%s %s', $console, 'doctrine:schema:create'));
passthru(sprintf(%s %s', $console, 'doctrine:fixtures:load --no-interaction'));
```

bootstrap.php
```
use Symfony\Bundle\FrameworkBundle\Console\Application;
use Symfony\Component\Console\Input\ArrayInput;
use Symfony\Component\Console\Output\ConsoleOutput;
use Symfony\Component\Dotenv\Dotenv;

// Assuming the command is registered in your application bootstrap
$application = new Application($kernel);
$application->setAutoExit(false);

  $input = new ArrayInput( [
            'command' => 'doctrine:database:drop',
            '--force' => true,
        ]);
  $output = new ConsoleOutput();
  $application->run($input, $output);
```

---
@ref:
* [https://www.php.net/manual/en/types.comparisons.php](https://www.php.net/manual/en/types.comparisons.php)
* [https://www.php.net/manual/en/language.operators.precedence.php](https://www.php.net/manual/en/language.operators.precedence.php)
