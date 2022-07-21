module Homework.E
(
    eval
) where

data ExprT = Lit Integer
    | Add ExprT ExprT
    | Mul ExprT ExprT 
    deriving (Show, Eq)

-- parseExp :: String 

-- Exercise 1: Evaluate expression
eval :: ExprT -> Integer
eval (Lit x) = x
eval (Add expr1 expr2) = eval expr1 + eval expr2
eval (Mul expr1 expr2) = eval expr1 * eval expr2

-- Exercise 2: Evaluate string
evalStr :: String -> Maybe Integer