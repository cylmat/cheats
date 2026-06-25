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

### d-flex usages

```
 .d-flex-column {
  display: flex;
  flex-direction: column;
  min-height: 0; // IMPORTANT TO SCROLL /* to allow children with height 100% to not exceed the parent height */
}

.d-flex-h100 { // Used for Bootstrap "col" or "row" with height 100% to allow children to use all the height of the parent
  display: flex;
  height: 100%;
}

.d-flex-row {
  display: flex;
  flex-direction: row;
}

.flex-1 {
  flex: 1; // flex-grow: 1; /* can grow */ flex-shrink: 1; /* can shrink */ flex-basis: 0%; /* starting size */
}
```
