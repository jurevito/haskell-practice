# Haskell practice
Repository for learning to code in Haskell. Good resources for learning:
- Book with a lot of examples and basic theory: [Learn You a Haskell for Great Good!](http://www.learnyouahaskell.com/chapters) 
- Lectures and homework assignments: [Some university lectures 2013](https://www.seas.upenn.edu/~cis194/spring13/lectures.html)
- Paper on functional language: [Why Functional Programming Matters](https://academic.oup.com/comjnl/article-pdf/32/2/98/1445644/320098.pdf)

## GHCI and Cabal Commands
Add module search path: `:set -iC:\Documents\src\`
Building and running project in cabal: `cabal build` and `cabal run`

## Lists
To join two list you can use `++` operator. To append element at the beginning of a list `x:xs` use `:`.
```haskell
let list1 = [1,2,3,4] ++ [1,2,3,4]                    -- [1,2,3,4,1,2,3,4]
let list2 = [x*2 | x <- [1..10],  (x*2) `mod` 3 == 0] -- [6,12,18]
```

## Types and Typeclasses
Defining a function has three parts. Function name `somefunction`, typleclass constraints `(Integral a, Ord b)` and after `=>` there are input parameters, except the last one which is output value.

```haskell
someFunction :: (Integral a, Ord b) => a -> b -> String
someFunction :: Int -> Int -> Bool
someFunction :: (Floating a) => a -> a -> a
```

#### Types
- `Int` whole numbers, 32bits.
- `Integer` bigger less efficient whole numbers, no limit.
- `Float` small floating numbers, single precision.
- `Double` bigger floating numbers, double precision.
- `Bool` boolean type with `True` and `False`.
- `Char` character type, list of character is a `String`.

#### Typeclasses
- `Eq` includes types that support equality testing. (`==` and `/=`)
- `Ord` types that can be ordered.
- `Show` types that can be displayed in console with string. (functions not included)
- `Read` can be read as a string and converted into type.
- `Enum` sequentially order types, that have succesor and predecesor. (`[LT..GT]`, (`[1..10]`, (`['A'..'Q']`,)
- `Bounded` types with upper and lower limit.
- `Num` numeric types.
- `Integral` integer types, whole numbers.
- `Floating` floating types, real numbers.

## Patterns and Guards
```haskell
sumOdd :: (Num a) => [a] -> a
sumOdd [] = 0
sumOdd (x:xs)
    | odd x     = x + sumOdd xs
    | otherwise = sumOdd xs
```
## Higher order functions and Currying
Currying is the technique of converting a function that takes multiple arguments into a sequence of functions that each takes a single argument. Every function in haskell takes **only** one argument and returns one result. Function `max` takes only first integer and returns a function which takes a integer and returns a integer. We can write it like this `max :: (Num a) => a -> (a -> a)`.
```haskell
max :: Int -> Int -> Int
max a b = if a > b then a else b

compareWithFive :: Int -> Int
compareWithFive = max 5 -- 'compareWithFive n = max 5 n', we can omit 'n' because of currying
```

A higher order function is a function that takes a function as an argument, or returns a function. In haskell most used higher order functions are `map`, `filter` and `foldr`.
```haskell
someList = [1,2,3,4]
map (+3) someList == [4,5,6,7]
map (*2) someList == [2,4,6,8]
filter (\x -> x > 2) someList == [3,4]
```

## Creating and importing modules
Example of importing entire module, importing some fucntions, importing all functions inside module except some and importing module as something (to avoid naming collisions). You can use its functions like this `List.sort someList`.

```haskell
import Data.List
import Data.List (nub, sort)
import Data.List hiding (nub, sort)
import qualified Data.List as List
```
Popular modules:
- `Data.List` module to work with lists.
- `Data.Char` module to work with characters.
- `Data.Map` module to work with association lists or dictionaries.
- `Data.Set` module to work with sets.

To create our own module we have to specify it in the beginning of a file. And after that implement all the fucntion we are exporting. We dont't have to export all the functions, only the ones we want to use.

```haskell
module Geometry
(   
    sphereVolume,
    sphereArea,
    cubeVolume,
    cubeArea,
    cuboidVolue,
    cuboidArea
) where
```

