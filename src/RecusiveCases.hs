module RecusiveCases where

import Data.Bits (Bits (xor))
import System.Posix.Internals (c_ftruncate)

-- 使用递归求List最大值
maximum' [] = error "empty"
maximum' [x] = x
maximum' (x : xs) = max x (maximum' xs)

-- 使用递归求List最大值
maximum'' [] = error "empty"
maximum'' [x] = x
maximum'' (x : xs)
  | x > maxTail = x
  | otherwise = maxTail
  where
    maxTail = maximum'' xs

replicate' n x
  | n <= 0 = []
  | otherwise = x : replicate' (n - 1) x

take' n _
  | n <= 0 = []
take' _ [] = []
take' n (x : xs) = x : take' (n - 1) xs

reverse' [] = []
reverse' (x : xs) = reverse' xs ++ [x]

repeat' x = x : repeat' x
