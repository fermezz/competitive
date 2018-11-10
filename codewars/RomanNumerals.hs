-- Codewars kata link: https://www.codewars.com/kata/51b62bf6a9c58071c600001b

module RomanNumerals where

import qualified Data.Map as M

solution :: Integer -> String
solution n = toRoman n numbers where
  numbers = M.fromList [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]


toRoman :: Integer -> M.Map Integer [Char] -> String
toRoman n numbers_map
  | M.null numbers_map = []
  | n >= (fst $ M.findMax numbers_map) = (snd $ M.findMax numbers_map) ++ toRoman (n - (fst $ M.findMax numbers_map)) numbers_map
  | otherwise = toRoman n $ M.deleteMax numbers_map
