module TupleCases where

-- 返回序对的首项
first = fst (8, 11)

sec = snd (8, 11)

zipped = zip [1, 2, 3, 4, 5] [1, 2]

-- 使用列表推导式 a<=b<=c 求出满足边长在10以内的直角三角形
rightTriangles = [(a, b, c) | c <- [1 .. 10], b <- [1 .. c], a <- [1 .. b], a * a + b * b == c * c]
