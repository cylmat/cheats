# Tips

## Syntaxic sugar
```
[, $b, $c, 'd' => $d] = $array   
foreach ($array as ['id' => $id, 'name' => $name])     
variadic_func( ...$a )  
[$a[2],$a[3]] = [$a[3],$a[2]];   
preg_replace_callback
```
 
## text as callback name:   
```
array_map('intval', preg_split('/ /', $arr_temp, -1, PREG_SPLIT_NO_EMPTY));
```

## %[^<char>] Get an input -sscanf- without limits until <char>
```
sscanf("3 5 9 11 109 8\n", "%[^\n]", $arr_temp);
```

## declare array in for loop
```
for ($l = array(1,1), $i = 2, $x = 0; $i < $length; $i++)
```

## private
```
$clone {private $runtime}
public function change() {
   $clone = clone $clonable;
   $clone->runtime = $runtime; // we can access it since we are in Object scope
   return $clone;
}
```

## sleep
```
_sleep : [prop1, prop2] vs __serialize : ['whatever'=>'whatever']
```

## Serializable::serialize vs __serialize
Serializable::serialize : the destructor is not called as a part of the object's serialization.
@see https://www.php.net/manual/en/language.oop5.magic.php#object.serialize

---
@ref:
* [https://www.php.net/manual/en/types.comparisons.php](https://www.php.net/manual/en/types.comparisons.php)
* [https://www.php.net/manual/en/language.operators.precedence.php](https://www.php.net/manual/en/language.operators.precedence.php)
