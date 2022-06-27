module CaseExamples where

-- 使用模式
head' [] = error "empty"
head' (x : _) = x

-- 上述head'等价于以下case定义
head'' xs = case xs of
  [] -> error "empty"
  (x : _) -> x

-- case表达式
describeList xs =
  "The list is " ++ case xs of
    [] -> "empty"
    [x] -> "singleton list"
    xs -> "a longer list"

-- 使用where
describeList' xs = "The list is " ++ what xs
  where
    what [] = "empty"
    what [x] = "singleton list"
    what xs = "a longer list"