-- simple functions
doubleMe x = x + x
doubleUs x y = x*2 + y*2
doubleSmallNumbers x = 
    if x > 100
    then x
    else x*2

-- [output for each element | each element of list, filter condition, filter condition]
oddNumbersBang xs = [if x > 10 then "bang" else "boom" | x <- xs, odd x, x/=7]

-- patern matching
numberToWord :: Integer -> String
numberToWord 1 = "One"
numberToWord 2 = "Two"
numberToWord 3 = "Three"
numberToWord _ = "I dont know how to spell this one."

-- guards
myBmiScore :: Float -> Float -> String
myBmiScore weight height
    | bmi < 18 = "You are very light. Eat some food!"
    | bmi < 25 = "You are just the right size"
    | otherwise = "You are obese. You should lose some weight!"
    where bmi = weight / (height ^ 2)

-- function that sums and list that contains numbers
mySum :: (Num a) => [a] -> a
mySum [] = 0
mySum (x:xs) = x + mySum xs

-- zips two lists of same type in a list of tuples
myZip :: [a] -> [a] -> [(a,a)]
myZip _ [] = []
myZip [] _ = []
myZip (x:xs) (y:ys) = (x,y) : myZip xs ys

-- gets maximum value in a list
myMax :: (Ord a) => [a] -> a
myMax [] = error "Cannot get maximum of an empty list."
myMax [x] = x
myMax (x:xs)
    | x > maxTail = x
    | otherwise = maxTail
    where maxTail = myMax xs

-- implement zip with another function (high order fucntion)
-- myZipWith (*) [2,3,4] [0,2,1,3]
-- [0,6,4]
-- myZipWith max [2,3,4] [0,2,1,3]
-- [2,3,4]
myZipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
myZipWith _ _ [] = []
myZipWith _ [] _ = []
myZipWith f (x:xs) (y:ys) = f x y : myZipWith f xs ys

-- implement max using fold
myMaxWithFold :: (Ord a) => [a] -> a
myMaxWithFold = foldl1 (\acc x -> if x > acc then x else acc)