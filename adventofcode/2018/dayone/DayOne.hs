import qualified Data.IntSet as IS

readInts :: String -> [Int]
readInts = map (read . filter (/= '+')) . lines

partOne :: String -> Int
partOne = sum . readInts

partTwo :: String -> Int
partTwo = go IS.empty . scanl (+) 0 . cycle . readInts
    where go acc (x:xs)
              | x `IS.member` acc = x
              | otherwise = go (IS.insert x acc) xs

main = do
  input <- readFile "input.txt"
  print $ partOne input
  print $ partTwo input
