-- Testing credit card number validity

toDigits :: Integer -> [Integer]
toDigits n = reverse $ toDigitsRev n

toDigitsRev :: Integer -> [Integer]
toDigitsRev n
    | n <= 0 = []
    | otherwise = (n `mod` 10) : toDigitsRev (n `div` 10)

doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther xs = fst $ foldr (\x (acc, isOther) -> ((if isOther then x*2 else x) : acc, not isOther)) ([], False) xs

sumDigits :: [Integer] -> Integer
sumDigits = foldl (\acc x -> acc + (sum $ toDigitsRev x)) 0

validate :: Integer -> Bool
validate xs = (sumDigits $ doubleEveryOther $ toDigits xs) `mod` 10 == 0

-- The towers of Hanoi

type Peg = String
type Move = (Peg, Peg)
hanoi :: Integer -> Peg -> Peg -> Peg -> [Move]
hanoi 1 p1 p2 p3 = [(p1,p2)] 
--hanoi n p1 p2 p3 = ((p1,p3) : hanoi (n-1) p1 p3 p2) ++ 

-- 3 [a,c] + (2 [a,b]) +
-- ([1,2,3],[],[]) (a,b) 
-- ([2,3],[1],[]) (a,c)
-- ([3],[1],[2]) (b,c)
-- ([3],[],[1,2]) (a,b) -----------------
-- ([],[3],[1,2]) (c,a) -----------------
-- ([1],[3],[2]) (c,b)
-- ([1],[2,3],[]) (a,b)
-- ([],[1,2,3],[])

-- ([1,2,3,4],[],[]) (a,c)
-- ([2,3,4],[],[1]) (a,b)
-- ([3,4],[2],[1]) (c,b)
-- ([3,4],[1,2],[]) (a,c)
-- ([4],[1,2],[3]) (b,a)
-- ([1,4],[2],[3]) (b,c)
-- ([1,4],[],[2,3]) (a,c)
-- ([4],[],[1,2,3]) -----------------