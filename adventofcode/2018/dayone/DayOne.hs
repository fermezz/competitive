readInts :: String -> [Int]
readInts = map (read . filter (/= '+')) . lines

partOne :: String -> Int
partOne = sum . readInts

partTwo :: String -> Int
partTwo = go [] . scanl (+) 0 . cycle . readInts
    where go acc (x:xs)
              | elem x acc = x
              | otherwise = go (x:acc) xs

main = do
  input <- readFile "input.txt"
  print $ partOne input
  print $ partTwo input
