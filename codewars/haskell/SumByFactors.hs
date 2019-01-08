-- Solution for https://www.codewars.com/kata/54d496788776e49e6b00052f

module Codewars.Kata.SumByFactors where
import Data.List
import Data.Function

sumOfDivided :: [Integer] -> [(Integer, Integer)]
sumOfDivided xs = concat $ map uniques sseqs
          where sseqs = groupBy ((==) `on` fst) [(x,y) | x <- primes, y <- xs, isFactor x y]
                isFactor x y = mod y x == 0
                primes = [2,3,5,7,11,17,23,29,31,41,53,59,61,79,107,1373,5653,7451,5882353,2000000011]
                uniques ys = nub $ map (\(x,y) -> (x, (sum . map snd) ys)) ys
