# CSS

### css flow

✅ why min-height-0 important: “You ARE allowed to shrink smaller than your content.”
```
- the default is min-height: auto; :  “I will grow… but I will NOT shrink smaller than my content.”
- Flex items refuse to shrink below their content by default.

    Legend says: “my content is 500px tall”
    Parent says: “I’m only 160px tall”
    Legend replies: “too bad, I won’t shrink” ❌ 
    overflow: auto finally works ✅
```
