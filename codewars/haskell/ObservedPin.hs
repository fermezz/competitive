-- Solution for https://www.codewars.com/kata/5263c6999e0f40dee200059d

module PIN where
import Data.List

-- First I did this crap with my poorly skilled Haskell.
-- oneAdjacent = ["1", "2", "4"]
-- twoAdjacent = ["2", "1", "5", "3"]
-- threeAdjacent = ["2", "3", "6"]
-- fourAdjacent = ["1", "4", "5", "7"]
-- fiveAdjacent = ["2", "4", "5", "6", "8"]
-- sixAdjacent = ["3", "5", "6", "9"]
-- sevenAdjacent = ["8", "4", "7"]
-- eigthAdjacent = ["5", "7", "8", "9", "0"]
-- nineAdjacent = ["6", "8", "9"]
-- zeroAdjacent = ["0", "8"]

-- getPINs :: String -> [String]
-- getPINs observed = getCombinations $ map adjacents observed where
         
--          adjacents :: Char -> [String]
--          adjacents number = case number of
--              '1' -> oneAdjacent
--              '2' -> twoAdjacent
--              '3' -> threeAdjacent
--              '4' -> fourAdjacent
--              '5' -> fiveAdjacent
--              '6' -> sixAdjacent
--              '7' -> sevenAdjacent
--              '8' -> eigthAdjacent
--              '9' -> nineAdjacent
--              '0' -> zeroAdjacent
         
--          getCombinations :: Foldable t => t [String] -> [String]
--          getCombinations = foldl1 (\xs ys -> [x++y | x <- xs, y <- ys])
--
--

-- mapM was a nice discovery.
--
adjacent :: Char -> String
adjacent x = case x of
  '1' -> "124"
  '2' -> "1235"
  '3' -> "236"
  '4' -> "1457"
  '5' -> "24568"
  '6' -> "3569"
  '7' -> "478"
  '8' -> "57890"
  '9' -> "689"
  '0' -> "80"

getPINs :: String -> [String]
getPINs = mapM adjacent
