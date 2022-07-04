module HighOrderFunc where

import RecusiveCases (maximum', reverse')

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

chain :: (Integral a) => a -> [a]
chain 1 = [1]
chain n
  | odd n = n : chain (n * 3 + 1)
  | otherwise = n : chain (n `div` 2)

-- map 用于多参数函数 返回一系列函数
listOfFuns = map (*) [0 ..]

-- !!根据下标取List元素
a16 = (listOfFuns !! 4) 5

-- lambda
moreThan15Chains = length (filter (\xs -> length xs > 15) (map chain [1 .. 100]))

-- 不全调用比lambda更有表现力
a17 = map (+ 3) [1, 2, 3, 4]

a18 = map (\x -> x + 3) [1, 2, 3, 4]

-- lambda也可以使用模式匹配 但匹配失败会引发运行时错误 慎用
a19 = map (\(a, b) -> a + b) [(1, 2), (3, 4)]

a20 = map (uncurry (+)) [(1, 2), (3, 4)]

addThree :: Num a => a -> a -> a -> a
addThree x y z = x + y + z

-- 类型声明写法的来源
addThree' :: Num a => a -> a -> a -> a
addThree' = \x -> \y -> \z -> x + y + z

flip''' f = \x y -> f y x

-- fold 替代如下sum''对List的递归处理模式
sum' xs = foldl (\acc x -> acc + x) 0 xs

sum'' [] = 0
sum'' (x : xs) = x + sum xs

elem' y ys = foldl (\acc x -> if x == y then True else acc) False ys

-- 对于List : 比 ++ 更高效 因此map选择右折叠
map'' f xs = foldr (\x acc -> f x : acc) [] xs

map''' f xs = foldl (\acc x -> acc ++ [f x]) [] xs

-- 所有遍历List并返回一个值的操作都可以使用fold
-- foldr可以处理无限List

-- foldl1 与 foldr1使用遇到的List的第一个元素作为起始值 若为空List会运行时错误
maximum' :: (Ord a) => [a] -> a
maximum' = foldr1 (\x acc -> if x > acc then x else acc)

reverse' :: [a] -> [a]
reverse' = foldl (\acc x -> x : acc) []

product' :: (Num a) => [a] -> a
product' = foldl1 (*)

filter''' :: (a -> Bool) -> [a] -> [a]
filter''' p = foldr (\x acc -> if p x then x : acc else acc) []
-- 以下head和last实现仅为了使用fold使用 使用模式匹配的实现最佳
head' :: [a] -> a
head' = foldr1 (\x _ -> x)

last' :: [a] -> a
last' = foldl1 (\_ x -> x)

-- scanl scanr与foldl foldr执行过程类似但会返回累加值的列表
