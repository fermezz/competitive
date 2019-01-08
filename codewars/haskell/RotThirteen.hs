-- Codewars kata link:  https://www.codewars.com/kata/530e15517bc88ac656000716

module Rot13 where

import Data.Char

rot13 :: String -> String
rot13 [] = []
rot13 xs = fmap shift xs

shift :: Char -> Char
shift c
  | base c <= ord c && ord c <= base c + 25 = chr $ (13 + ord c - base c) `mod` 26 + base c
  | otherwise = c

base :: Char -> Int
base c
  | isUpper c = ord 'A'
  | otherwise = ord 'a'
