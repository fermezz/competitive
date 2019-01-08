-- Solution for https://www.codewars.com/kata/526d84b98f428f14a60008da

module Hamming where
import Data.List

hamming  :: Int -> Integer
hamming n = let perms = [(a,b,c) | c <- [0..numberOfPermutations n], b <- [0..numberOfPermutations n], a <- [0..numberOfPermutations n]]
            in (last . take n . sort) $ map (\(x,y,z) -> 2^x * 3^y * 5^z) $ perms
     
numberOfPermutations :: Int -> Int
numberOfPermutations n
                   | n < 3 = n
                   | otherwise = (div n 3) + 1
