# REGEXP

This covers POSIX + PCRE (grep -P).  
You can skim or search it like a cheatsheet.

```
🔹 BASIC REGEX (BRE / ERE)
.        any character (except newline)                 a.c → abc
^        start of line                                  ^ERROR
$        end of line                                    done$
*        0 or more of previous                          ab*
+        1 or more of previous (ERE/PCRE)               ab+
?        0 or 1 of previous (ERE/PCRE)                  colou?r
[]       character class                                [aeiou]
[^ ]     negated character class                        [^0-9]
[a-z]    range                                          [A-Z]
\        escape special char                            \.
|        alternation (ERE/PCRE)                         cat|dog
()       capturing group (ERE/PCRE)                     (abc)+

🔹 COMMON REGEX TOKENS (VERY FREQUENT)
\d       digit                                          \d+
\D       non-digit                                      \D+
\w       word char [A-Za-z0-9_]                          \w+
\W       non-word                                       \W+
\s       whitespace                                     \s+
\S       non-whitespace                                 \S+
\b       word boundary                                  \bcat\b
\B       not word boundary                              \Bcat\B
{n}      exactly n times                                \d{4}
{n,}     n or more                                      \d{2,}
{n,m}    between n and m                                \d{2,4}

  ex: grep -P '\bcat\b'     match: cat         not: catenate
  ex: grep -P '\Bcat\B'     match: catalog     not: cat

🔹 LINE / INPUT ANCHORS
^        start of line                                  ^INFO
$        end of line                                    failed$
\A       start of input                                 \AERROR
\Z       end of input (before final newline)            END\Z
\z       absolute end of input                          END\z

🔹 GROUPING & REFERENCES
(...)    capturing group                                (ab)+
(?:...)  non-capturing group (no reused)                (?:ab)+
\1       backreference to group 1                       (\w+)\s+\1
\2       backreference to group 2                       (a)(b)\2

  ex: grep -P '\b(\w+)\s+\1\b'      match: gamma gamma


🔹 LOOKAROUNDS (ADVANCED)
(?=...)  positive lookahead                             error(?=\s\d+)     Match only if followed by something
(?!...)  negative lookahead                             error(?!\signored) Match only if NOT followed by something
(?<=...) positive lookbehind                            (?<=user=)\w+      Match only if something comes before
(?<!...) negative lookbehind                            (?<!/)root         Match only if NOT preceded by something
(?>...)  prevent backtracking                                              Used to avoid backtracking in big patterns
(?|...)                                                                    Reset capture group numbers

  ex: grep -P 'error(?=\s+\d+)'   match: error 404      not: error input
  ex: grep -P '(?<=user7)\w+'     match: user7alice     not: alice
  ex: grep -P '(?>\d+)\w' file

⚠ Lookbehind must be fixed-length in grep -P

🔹 LAZY (NON-GREEDY) QUANTIFIERS  (Minimal match)
*?       lazy zero or more                               <.*?>
+?       lazy one or more                                ".+?"    Matches quoted strings one at a time
??       lazy optional                                  colou??r
{n,m}?   lazy bounded                                   \d{2,5}?

  ex: GREEDY grep -P '<.*>'    <tag>one</tag><tag>two</tag>   match: <tag>one</tag><tag>two</tag>
  ex: LAZY   grep -P '<.*?>'   <tag>one</tag><tag>two</tag>   match: <tag> or </tag>

🔹 INLINE MODIFIERS (PCRE)
(?i)     case-insensitive                                (?i)error
(?m)     multiline (^ $ per line)                        (?m)^WARN
(?s)     dot matches newline                             (?s)BEGIN.*END
(?x)     free-spacing + comments                         (?x)a  # comment

  ex: grep -P '(?i)error'
  ex: grep -P '(?x)
    \b\d{4}     # year
    -\d{2}      # month
    -\d{2}\b    # day
  ' file


🔹 CHARACTER ESCAPES
\n       newline                                        \n
\t       tab                                            \t
\r       carriage return                                \r
\f       form feed                                      \f
\a       bell                                           \a
\e       escape                                         \e

🔹 BYTES & UNICODE (use final "/u")
\xHH     hex byte                                       \x3a
\x{HHHH} Unicode code point                             \x{20AC}
\p{L}    Unicode letter                                 \p{L}+
\P{L}    not Unicode letter                             \P{L}+
\p{N}    any Unicode number

  ex: grep -P '\x3a'
  ex: grep -P '\x{20AC}'
  ex: /^[\p{L}\p{N}]+$/u   (alphanumeric with accents, unicode) 


🔹 CONDITIONAL / LOGICAL
|        OR                                             error|warn
(?(1)A|B) if group 1 matched then A else B               (?(1)yes|no)

🔹 ATOMIC & PERFORMANCE (EXPERT)
(?>...)  atomic group (no backtracking)                  (?>\d+)\w
(*SKIP)  skip match (PCRE)                               foo(*SKIP)bar
(*F)     force failure                                  bad(*F)

🔹 RESET / BRANCH CONTROL (EXPERT)
(?|...)  reset capture numbers                           (?|(a)|(b))
(?>...)  possessive group                                (?>ab)+

🔹 DOT & NEWLINES
.        any char except newline                         a.b
[\s\S]   any char including newline                     [\s\S]*

🔥 REAL-WORLD ONE-LINERS
\b\d{4}-\d{2}-\d{2}\b            date YYYY-MM-DD
(?<=@)\w+\.\w+                   email domain
\.log(?!\.gz)                    .log but not .log.gz
\b(\w+)\s+\1\b                   duplicate word
(?i)\b(todo|fixme)\b             TODO/FIXME (case-insensitive)

🧠 Mental Model (Quick)

Basic → . * [] ^ $
Common → \d \w \s \b {}
Advanced → (?: ) (?= ) (?<= ) *?
Expert → (?> ) (?| ) (*SKIP)
```

-----------------------------------------------------------------

last occurence (<occurence>, not followed by <occurence>)
```
'/(.*;)(?!.*;)$/'
```

### Modifiers
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

### Sample

match IPv4 address
```
grep -P '\b(?:\d{1,3}\.){3}\d{1,3}\b'
```

alternation grouping
```
grep -P '(error|warning|fatal):\s+.*'
```

match password but hide value
```
grep -P '(?<=password=)[^&\s]+'
```

Match .log files but not .gz
```
grep -P '\.log(?!\.gz)'
```

Match email domains but exclude gmail.com
```
grep -P '(?<=@)(?!gmail\.com)\w+\.\w+' 
```

Match variable names, not inside words
```
grep -P '\b[A-Za-z_]\w*\b'  <file>
```

Match TODO comments
```
grep -P '(?i)\bTODO\b.*$' 
```

---
**@ref** 
+ https://www.debuggex.com/cheatsheet/regex/pcre
+ https://www.regular-expressions.info/lookaround.html
+ https://www.rexegg.com/regex-quickstart.html
+ https://regex101.com/
+ https://extendsclass.com/regex-tester.html
