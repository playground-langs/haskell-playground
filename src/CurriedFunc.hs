module CurriedFunc where

-- 本质上所有haskell函数只有一个参数 所有具有多个参数的函数都是curried functions
-- 空格为函数调用 具有最高优先级 可以使用()改变优先级
maxWith4 = max 4

compareWith100 = compare 100

divideBy10 = (/ 10)

isUpperAlpha = (`elem` ['A' .. 'Z'])