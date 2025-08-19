
### scss

```
.-icon {
  @each $key, $value in $status-list {
    &__#{$value} {
      fill: var(--status-#{$value});
    }
    &__#{$value}_selected {
      fill: var(--status-#{$value});
      stroke: var(--status-#{$value});
    }
  }
}
```
