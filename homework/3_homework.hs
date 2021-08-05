-- Exercise 1 Hopscotch
everyNth :: Int -> [a] -> [a]
everyNth n xs = snd <$> filter (\(i, v) -> i `mod` n == 0) (zip [1..] xs)

skips :: [a] -> [[a]]
skips xs = foldr (\(n, v) acc -> everyNth n v : acc) [] (zip [1..(length xs)] (repeat xs))
