-- Solution for https://www.codewars.com/kata/55911ef14065454c75000062

module MultNumAsStrings where

import Data.Char (intToDigit, digitToInt)

-- | mulitply two numbers as strings
-- This was my first solution as I wanted to multiply numbers given as strings with highschool math.
-- Like:
--       12345
--   *     123
--   ---------
--       37035
--   +  246900
--   + 1234500
--   ---------
--   1.518.435
--
multiply :: String -> String -> String
multiply xs ys = (show . sum . map read) $ partitions (read xs) (multiplier ys)

multiplier :: String -> [(Int, Int)]
multiplier = zip [0..] . reverse  . map digitToInt

partitions :: Integer -> [(Int, Int)] -> [String]
partitions n = map (\(x,y) -> (show (n * toInteger y)) ++ replicate x '0')


-- Of course, a much simpler solution would be
-- multiply :: String -> String -> String
-- multiply xs ys = show $ read xs * read ys
