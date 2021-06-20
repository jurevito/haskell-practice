# haskell-practice
Repository for learning to code in Haskell.

```haskell
-- [output for each element | each element of list, filter condition]
oddNumbersBang xs = [if x > 10 then "bang" else "boom" | x <- xs, odd x, x/=7]
```
