# Haskell practice
Repository for learning to code in Haskell. Good resources for learning:
- [Learn You a Haskell for Great Good!](https://www.learnyouahaskell.com/chapters): book with a lot of examples and basic theory.
- [Some university lectures](https://www.seas.upenn.edu): lectures and homework assignments.

### List manipulation
```haskell
-- [output for each element | each element of list, filter condition]
oddNumbersBang xs = [if x > 10 then "bang" else "boom" | x <- xs, odd x, x/=7]
```

### Types and Typeclasses
Defining a function has three parts. Function name `somefunction`, typleclass constraints `(Integral a, Ord b)` and after `=>` there are input parameters, except the last one which is output value.

```haskell
someFunction :: (Integral a, Ord b) => a -> b -> String
someFunction :: Int -> Int -> Bool
someFunction :: (Floating a) => a -> a -> a
```

Types:
- *Int* whole numbers, 32bits.
- *Integer* bigger less efficient whole numbers, no limit.
- *Float* small floating numbers, single precision.
- *Double* bigger floating numbers, double precision.
- *Bool* boolean type with `True` and `False`.
- *Char* character type, list of character is a `String`.

Typeclasses:
- *Eq* includes types that support equality testing. (`==` and `/=`)
- *Ord* types that can be ordered.
- *Show* types that can be displayed in console with string. (functions not included)
- *Read* can be read as a string and converted into type.
- *Enum* sequentially order types, that have succesor and predecesor. (`[LT..GT]`, (`[1..10]`, (`['A'..'Q']`,)
- *Bounded* types with upper and lower limit.
- *Num* numeric types.
- *Integral* integer types, whole numbers.
- *Floating* floating types, real numbers.

### Patterns and Guards

### Higher order functions and Currying

### Creating and Importing modules
Example of importing entire module, importing some fucntions, importing all functions inside module except some and importing module as something (to avoid naming collisions). You can use its functions like this `List.sort someList`.

```haskell
import Data.List
import Data.List (nub, sort)
import Data.List hiding (nub, sort)
import qualified Data.List as List
```
Popular modules:
- `Data.List`: module to work with lists.
- `Data.Char`: module to work with characters.
- `Data.Map`: module to work with association lists or dictionaries.
- `Data.Set`: module to work with sets.

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
)
```

