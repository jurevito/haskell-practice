{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use map" #-}
module Homework.D
(
    fun1,
    fun2,
    fun1',
    fun2',
    xor,
    map'
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
fun2' = sum . filter even . takeWhile (/=1) . iterate (\x -> if even x then x `div` 2 else 3 * x + 1)

-- Exercise 2: Folding with trees
--data Tree a = Leaf | Node Integer (Tree a) a (Tree a) deriving (Show, Eq)
--
--insertBalanced :: Integer -> a -> Tree a -> Tree a
--insertBalanced n value Leaf = Node n Leaf value Leaf
--insertBalanced n value Node
--
--foldTree :: [a] -> Tree a
--foldTree = foldr (\x acc -> insertBalanced 0 x acc) Leaf

-- Exercise 3: More folds!
xor :: [Bool] -> Bool
xor = foldr (\x acc -> if x then not acc else acc) False

map' :: (a -> b) -> [a] -> [b]
map' f = foldr (\x acc -> f x : acc) []

--myFoldl :: (a -> b -> a) -> a -> [b] -> a
--myFoldl f base xs = foldr (\x acc -> acc ++ ) base

-- Exercise 4: Finding primes
sieveSundaram :: Integer -> [(Integer, Integer)]
sieveSundaram n = [(i,j) | (i,j) <- cartProd [0..n] [0..n], i+j+(2*i*j) > n && i > j]

cartProd :: [a] -> [b] -> [(a, b)]
cartProd xs ys = [(x,y) | x <- xs, y <- ys]