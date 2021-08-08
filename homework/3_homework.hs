import qualified Data.Map as M
import qualified Data.List as L

-- Exercise 1 Hopscotch
everyNth :: Int -> [a] -> [a]
everyNth n xs = snd <$> filter (\(i, v) -> i `mod` n == 0) (zip [1..] xs)

skips :: [a] -> [[a]]
skips xs = foldr (\(n, v) acc -> everyNth n v : acc) [] (zip [1..(length xs)] (repeat xs))

-- Exercise 2 Local maxima
localMaxima :: [Integer] -> [Integer]
localMaxima (x:y:z:xs)
    | x < y && y > z = y : localMaxima (y:z:xs)
    | otherwise      = localMaxima (y:z:xs)
localMaxima _ = []

-- Exercise 3 Histogram
frequency :: (Ord a) => [a] -> M.Map a Int
frequency xs = foldl (\acc x -> M.insertWith (+) x 1 acc) (M.fromList $ zip xs (repeat 0)) xs

count :: (Eq a) => a -> [a] -> Int
count n = foldl (\acc x -> acc + (if x == n then 1 else 0)) 0

placeAsterix :: Int -> Integer -> [Integer] -> String
placeAsterix _ 10 _ = "\n"
placeAsterix k n xs = (if count n xs >= k then '*' else ' ') : placeAsterix k (n+1) xs

histHelp :: Int -> [Integer] -> String
histHelp 0 _ = []
histHelp k xs = placeAsterix k 0 xs ++ histHelp (k-1) xs

histogram :: [Integer] -> String
histogram [] = ""
histogram xs = histHelp (L.maximum $ snd <$> M.toList (frequency xs)) xs ++ "==========\n0123456789\n"

