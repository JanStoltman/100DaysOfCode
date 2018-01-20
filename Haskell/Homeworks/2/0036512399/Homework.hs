module Homework where
--
import Data.List
import Data.Char
--

-- Task 01
toRNA :: String -> String
toRNA "" = []
toRNA (x:xs) = hMapNucleotides x : toRNA xs
-- Helper
hMapNucleotides :: Char -> Char
hMapNucleotides nc 
  |nc == 'G' = 'C' 
  |nc == 'C' = 'G'
  |nc == 'T' = 'A'
  |nc == 'A' = 'U'
  |otherwise = error (nc : " - Nucleotide doesn’t exist")

-- Task 02
multiply :: Int -> Int -> Int
multiply n 0 = 0
multiply 0 _ = 0
multiply n m  
  |m > 0 = n + multiply n (m-1)
  |m < 0 = (-n) + multiply n (m+1)

divide :: Int -> Int -> Int
divide n d 
  |xor (n < 0) (d < 0) = - hDivide (abs(n)) (abs(d)) 0 
  |otherwise           = hDivide n d 0 

-- Helper
hDivide :: Int -> Int -> Int -> Int
hDivide n d c 
  |d == 0          = error "Cannot divde by zero" 
  |abs(n) < abs(d) = c
  |otherwise       = hDivide (n-d) d (c+1) 


greatestCD :: Int -> Int -> Int
greatestCD a b 
  |b == 0 = a
  |otherwise = greatestCD b (a `mod` b) 

-- Task 03
numberToWords :: Int -> String
numberToWords n 
 |n  < 0 = "minus " ++ hNumberToWords (abs n) 
 |n >= 0 = hNumberToWords n 

hNumberToWords :: Int -> String
hNumberToWords n 
  |n >= milion   = advNumToWord milions milion ++ 
                   " milion " ++ 
                   hNumberToWords (n `mod` milion) 

  |n >= thousand = advNumToWord thousands thousand ++
                   " thousand " ++ 
                   hNumberToWords (n `mod` thousand) 

  |n >= hundred  = basicNumToWord hundreds ++ 
                   " hundred " ++
                   hNumberToWords (n `mod` hundred) 

  |n >= (2*ten)  = basicNumToWord (n - (n `mod` ten)) ++ 
                   (if(n `mod` ten /= 0) then "-" else "") ++
                   hNumberToWords (n `mod` ten)

  |otherwise     = basicNumToWord n

  where milion    = 1000000
        thousand  = 1000
        hundred   = 100
        ten       = 10
        milions   = divide n milion
        thousands = divide n thousand
        hundreds  = divide n hundred
        tens      = divide n ten
        
advNumToWord :: Int -> Int -> String
advNumToWord a b 
  |a `mod` b == 0 = basicNumToWord a
  |otherwise = numberToWords (a `mod` b) 

basicNumToWord :: Int -> String
basicNumToWord a 
  |a == 0    = "zero"
  |a == 1    = "one" 
  |a == 2    = "two"
  |a == 3    = "three"
  |a == 4    = "four" 
  |a == 5    = "five" 
  |a == 6    = "six"
  |a == 7    = "seven"
  |a == 8    = "eight"
  |a == 9    = "nine"
  |a == 10   = "ten"
  |a == 11   = "eleven"
  |a == 12   = "twelve"
  |a == 13   = "thirteen"
  |a == 14   = "fourteen"
  |a == 15   = "fifteen"
  |a == 16   = "sixteen"
  |a == 17   = "seventeen"
  |a == 18   = "eighteen"
  |a == 19   = "nineteen"
  |a == 20   = "twenty"
  |a == 30   = "thirty"
  |a == 40   = "fourty"
  |a == 50   = "fifty"
  |a == 60   = "sixty"
  |a == 70   = "seventy"
  |a == 80   = "eighty"
  |a == 90   = "ninety"
  |otherwise = ""


-- Task 04
undefined' :: a
undefined' = error "My own undefined'"



--Helpers 
xor :: Bool -> Bool -> Bool
xor x y | x == True && y == False = True
        | x == False && y == True = True
        | otherwise = False
