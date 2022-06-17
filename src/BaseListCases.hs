-- List相加 ++ 会遍历第一个List
l1 = [1, 2, 3] ++ [3, 4, 5]

l2 = 1 : [2, 3, 4]

-- 按索引取值
c1 = "abcd" !! 2

-- List比较 逐项比较
b1 = [3, 2, 1] > [1, 2, 3]

l3 = [1, 2, 3, 4, 5]

-- head+tail==init+last
b2 = head l3 == 1

b3 = tail l3 == [2, 3, 4, 5]

b4 = init l3 == [1, 2, 3, 4]

b5 = last l3 == 5

-- 判空
b6 = null [] == True

-- 包含
b7 = (1 `elem` l3) == True

-- 区间
range1 = [1 .. 20]

-- 倒序区间
range2 = [20, 19 .. 1]

-- 指定区间步长
range3 = [2, 4 .. 20]

-- 无限区间 奇数
range4 = [1, 3 ..]

-- 根据List生成无限循环区间
list1 = take 10 (cycle [1, 2, 3])

-- 字符串本质是字符List
list2 = take 12 (cycle "LOL ")

-- 单值无限重复
list3 = take 10 (repeat 5)

-- list3 使用replicate
list3' = replicate 10 5
