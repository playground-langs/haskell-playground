module FuncPatternMatch where

import GHC.Real (Integral)

-- 函数可以通过模式匹配来逐步定义

-- 输出1-5的对应英文 其他不处理
-- 按顺序模式匹配
sayMe :: Integral a => a -> String
sayMe 1 = "One"
sayMe 2 = "Two"
sayMe 3 = "Three"
sayMe 4 = "Four"
sayMe 5 = "Five"
sayMe x = "not between 1 and 5"

-- 递归求阶乘
factorial :: Integral a => a -> a
factorial 0 = 1
factorial n = n * factorial (n - 1)

-- 元组也可以模式匹配
addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

-- 三元组取元素

first (x, _, _) = x

second (_, y, _) = y

third (_, _, z) = z

-- List也可以模式匹配

-- 实现自己的head
-- 绑定多个变量必须使用括号

head' [] = error "empty list"
head' (x : _) = x

--递归实现length
length' [] = 0
length' (_ : xs) = 1 + length' xs

-- 递归实现sum

sum' [] = 0
sum' (x : xs) = x + sum xs

-- as 模式 将名字和@至于模式前 可保留整体引用
-- 模式匹配中不能使用++

capital "" = "empty string"
capital all@(x : xs) = "the first letter of " ++ all ++ " is " ++ [x]