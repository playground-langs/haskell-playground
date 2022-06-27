module GuardCases where

-- guard
-- 需要外部计算bmi作为参数
bmiTell :: (RealFloat a) => a -> String
bmiTell bmi
  | bmi <= 18.5 = "underweight"
  | bmi <= 25.0 = "normal"
  | bmi <= 30.0 = "fat"
  | otherwise = "whale"

-- 条件有重复
bmiTell1 weight height
  | weight / height ^ 2 <= 18.5 = "underweight"
  | weight / height ^ 2 <= 25.0 = "normal"
  | weight / height ^ 2 <= 30.0 = "fat"
  | otherwise = "whale"

-- 中缀形式定义函数
a `myCompare` b
  | a > b = GT
  | a == b = EQ
  | otherwise = LT

-- 解决guard中的重复 where中的定义在guard在内的整个函数中可见,且不会在多个模式中共享
bmiTell2 weight height
  | bmi <= 18.5 = "underweight"
  | bmi <= 25.0 = "normal"
  | bmi <= 30.0 = "fat"
  | otherwise = "whale"
  where
    bmi = weight / height ^ 2

-- where定义多个变量
bmiTell3 weight height
  | bmi <= skinny = "underweight"
  | bmi <= normal = "normal"
  | bmi <= fat = "fat"
  | otherwise = "whale"
  where
    bmi = weight / height ^ 2
    skinny = 18.5
    normal = 25.0
    fat = 30.0

-- where中可以使用模式匹配
bmiTell4 weight height
  | bmi <= skinny = "underweight"
  | bmi <= normal = "normal"
  | bmi <= fat = "fat"
  | otherwise = "whale"
  where
    bmi = weight / height ^ 2
    (skinny, normal, fat) = (18.5, 25.0, 30.0)

-- 可以在where中定义函数
-- 计算一组bmi
calcBmis xs = [bmi w h | (w, h) <- xs]
  where
    bmi w h = w / h ^ 2

-- let绑定 定义局部变量 当前作用域内可见
-- let是个表达式 where是语法结构不是表达式
-- let也可以定义局部函数
cylinder r h =
  let sideArea = 2 * pi * r * h
      topArea = pi * r ^ 2
   in sideArea + 2 * topArea

-- let绑定多个变量需要用分号隔开
sum3 =
  let a = 1; b = 1; c = 1 in a + b + c

-- List中使用let
calcBmis1 xs = [bmi w h | (w, h) <- xs, let bmi w h = w / h ^ 2]
