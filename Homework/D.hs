module Homework.D
(
    fun1',
    fun2'
) where

-- Exercise 1: Wholemeal programming
fun1 :: [Integer] -> Integer
fun1 [] = 1
fun1 (x:xs)
    | even x = (x - 2) * fun1 xs
    | otherwise = fun1 xs

fun2 :: Integer -> Integer
fun2 1 = 0
fun2 n 
    | even n = n + fun2 (n `div` 2)
    | otherwise = fun2 (3 * n + 1)

fun1' :: [Integer] -> Integer
fun1' = foldl (\acc x -> if even x then acc * (x-2) else acc) 1

fun2' :: Integer -> Integer
fun2' = sum . filter (even) . takeWhile (/=1) . iterate (\x -> if even x then x `div` 2 else 3 * x + 1)

-- Exercise 2: Folding with trees
data Tree a = Leaf | Node Integer (Tree a) a (Tree a) deriving (Show, Eq)

--foldTree :: [a] -> Tree a
--foldTree = foldr (\x acc -> ) (Leaf)