import Data.Char

prod a@(x:xs) = sum $ map ceo $ group 2 (a ++ [x])

ceo (x:a:[]) = if x == a then digitToInt x else 0 
ceo _        = 0

group _ []     = []
group _ (x:[]) = []
group n xs 
  |n > 0   = (take (n) xs) : (group n $ drop 1 xs)

test  = prod "1122" == 3 && prod "1111" == 4 && prod "1234" == 0 && prod "91212129" == 9
test2 = prod2 "1212" == 6 && prod2 "1221" == 0 && prod2 "123425" == 4  && prod2 "12131415" == 4 && prod2 "123123" == 12

--prod2 :: String -> Int
prod2 xs =sum $ map ceo $ pap $ splitAt (quot (length xs) 2) xs

pap (a,b) = lpap (a,b) ++ lpap (b,a)

lpap (_,[]) = []
lpap ([],_) = []
lpap ((a:as),(b:bs)) = (a:b:[]) : (lpap (as, bs))
