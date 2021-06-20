-- simple functions
doubleMe x = x + x
doubleUs x y = x*2 + y*2
doubleSmallNumbers x = 
    if x > 100
    then x
    else x*2

-- [output for each element | each element of list, filter condition]
oddNumbersBang xs = [if x > 10 then "bang" else "boom" | x <- xs, odd x, x/=7]