module ListComprehensionCases where

-- 列表推导式
-- S={2*x|x∈N,x<=10}
b1 = [2 * x | x <- [1 .. 10]] == [2, 4 .. 2 * 10]

-- 添加条件
l1 = [2 * x | x <- [1 .. 10], x * 2 >= 12]

--取50到100间所有除以7余3的元素
l2 = [x | x <- [50 .. 100], x `mod` 7 == 3]

--变换返回值
boomBang xs = [if x < 10 then "BOOM" else "BANG" | x <- xs, odd x]

-- 多个条件
l3 = [x | x <- [10 .. 20], x /= 13, x /= 15, x /= 19]

-- 取多个List 数量为xy组合的积
l4 = [x * y | x <- [2, 5, 10], y <- [8, 10, 11]]

-- 求列表的长度
length' xs = sum [1 | _ <- xs]

-- 使用嵌套的List Comprehension
xxs = [[1, 2, 3], [4, 5, 6], [7, 8, 9, 10]]

l5 = [[x | x <- xs, even x] | xs <- xxs]