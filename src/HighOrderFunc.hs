module HighOrderFunc where

applyTwice f x = f (f x)

a1 = applyTwice (+ 3) 10

a2 = applyTwice (++ "HAHA") "HEY"

a3 = applyTwice ("HAHA" ++) "HEY"

a4 = applyTwice (3 :) [1]

zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x : xs) (y : ys) = f x y : zipWith' f xs ys

a5 = zipWith' (+) [1, 2, 3] [4, 5, 6]

a6 = zipWith' max [6, 3, 2, 1] [7, 3, 1, 5]

a7 = zipWith' (*) (replicate 5 2) [1 ..]

a8 = zipWith' (zipWith' (*)) [[1, 2, 3], [4, 5, 6]] [[2, 4, 6], [7, 8, 9]]

flip' f = g
  where
    g x y = f y x

flip'' f x y = f y x

a9 = flip' zip [1, 2, 3] "hello"

-- map 与 filter 均可用List Comprehension替代
map' _ [] = []
map' f (x : xs) = f x : map' f xs

a10 = map' (+ 3) [1, 2, 3]

a11 = [x + 3 | x <- [1, 2, 3]]

-- 使用if-else
filter' _ [] = []
filter' p (x : xs) = if p x then x : filter' p xs else filter' p xs

--使用guard
filter'' _ [] = []
filter'' p (x : xs)
  | p x = x : filter'' p xs
  | otherwise = filter'' p xs

a12 = filter' (> 3) [1, 2 .. 6]

a13 = [x | x <- [1, 2 .. 6], x > 3]

quicksort [] = []
quicksort (x : xs) =
  let smaller = quicksort (filter' (<= x) xs)
      bigger = quicksort (filter' (> x) xs)
   in smaller ++ [x] ++ bigger

-- 计算平方和为奇数且小于10000的所有平方和的和
a14 = sum (takeWhile (< 10000) (filter odd (map (^ 2) [1 ..])))

a15 = sum (takeWhile (< 10000) [x | x <- [y ^ 2 | y <- [1 ..]], odd x])