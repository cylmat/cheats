# CSS

## 🟡 Flex Golden Rules

✅ The stable combo

bootstrap (grid if needed, lightly)  
-> Flex Grid : Page layout     <-  div grid (structure)  
-> Flex Flow : Elements inside <-  flex (layout)  
-> Flex table: Data model      <-  table (data only)  

```
Layout Golden Rules (practical version)

1. Use ONE layout system → prefer flex (avoid table for layout)

2. Define height ONLY once (top container)
   → example: height: 200px or height: 100%

3. Never rely on height: 100% unless ALL parents have a height

4. In flex:
   - Parent → display: flex
   - Growing child → flex: 1
   (NOT height: 100%)

5. For scrollable areas:
   - flex: 1
   - min-height: 0   ← REQUIRED
   - overflow: auto

6. If scroll doesn’t work:
   → you forgot min-height: 0 somewhere

7. Bootstrap:
   - .row = flex container
   - .col = flex item
   → don’t fight it, extend it

8. Tables:
   - only for data
   - never for layout
-------
One-line mental model

Height comes from ONE parent.
Space is distributed with flex.
Scroll needs min-height: 0.
------
 for scrolling

❌ table + height → unreliable
❌ height: 100% chain → broken
❌ no min-height: 0 → no scroll

✅ flex parent with fixed height
✅ child flex: 1
✅ min-height: 0 + overflow
```

 | System        | Use it for                     | How it works                          | Height behavior                         | Golden rule                                   | Avoid when…                         |
|--------------|-------------------------------|----------------------------------------|------------------------------------------|-----------------------------------------------|-------------------------------------|
| table        | Tabular data (real tables)     | Browser-controlled layout              | Content-driven, hard to control          | Never use for layout                          | You need scroll / flex / resizing    |
| bootstrap    | Page structure (grid)          | row = flex, col = flex items           | Needs parent height                      | Use for layout skeleton only                  | You need precise height control      |
| div (block)  | Basic structure                | Stacks vertically                      | Auto height (content-based)              | Default building block                        | You need alignment or distribution   |
| flex         | Layout, alignment, distribution| 1D layout (row OR column)              | Controlled via flex + parent height      | Your main layout tool                         | You need 2D grid (rare case)         |


- Ultra-simple decision guide

Need columns layout? → flex or bootstrap  
Need precise control (scroll, fill, spacing)? → flex  
Need simple stacking? → div  
Need real data table? → table (ONLY here)  
Height rules (the part that breaks everything)  

```
1. Height must come from ONE parent
2. flex: 1 replaces height: 100%
3. Scroll needs:
   - flex: 1
   - min-height: 0
   - overflow: auto

X -----------------> table + flex + bootstrap + height: 100% = chaos
```

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
