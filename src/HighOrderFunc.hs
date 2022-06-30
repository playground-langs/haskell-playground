module HighOrderFunc where

applyTwice f x = f(f x)

a1=applyTwice (+3) 10

a2=applyTwice (++ "HAHA") "HEY"

a3=applyTwice ("HAHA" ++) "HEY"

a4=applyTwice (3:) [1]