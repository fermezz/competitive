-- Solution for https://www.codewars.com/kata/54c9fcad28ec4c6e680011aa<Paste>

module Codewars.Exercise.MergeChecker where
import Data.List
import Data.Char

-- first I did this, don't know why I would map toLower buuuutt...

-- isMerge :: String -> String -> String -> Bool
-- isMerge s part1 part2 = let sortLower = sort . map toLower
--                         in sortLower s == sortLower (part1 ++ part2)
--
--
-- After reconsidering...

isMerge :: String -> String -> String -> Bool
isMerge s part1 part2 = sort s == sort (part1 ++ part2)
