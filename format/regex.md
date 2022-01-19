# REGEXP

Samples
---

**not (look-behind)**    
^(?!sample)...

**last occurence (<occurence>, not followed by <occurence>)**  
'/(.*;)(?!.*;)$/'  
  
**non-capturing group** (don't have to be reused)  
(?:)    
  
**negative lookaround**  
(?!)  

## Modifiers
[https://www.php.net/manual/en/reference.pcre.pattern.modifiers.php]
- i: ignore case
- m: multilines matcher
- s: "." char include newlines (DOTALL)
- x: ignore whitespaces (EXTENDED)
- u: allow utf8 (functionality of PCRE that is incompatible with Perl)

- A: force the pattern to be anchored the subject string
- D: "$" match only at the subject string (ignore with "m" modifier)
- S: analyzise pattern used several times
- U: invert greediness of quantifiers (UNGREEDY)
- X: extra functionality Pcre incompatible with Perl

e.g.: (?im-sx) is multimatching insensitive, and unset dotall extended

---
**@ref** 
+ https://www.debuggex.com/cheatsheet/regex/pcre
+ https://www.regular-expressions.info/lookaround.html
+ https://www.rexegg.com/regex-quickstart.html
+ https://regex101.com/
+ https://extendsclass.com/regex-tester.html
