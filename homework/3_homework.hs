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
