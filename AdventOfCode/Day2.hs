import Data.Function
splitNumbers = do 
  xs <- readFile "Day2DB"
  let s = sum [diff $ map sToInt $ words x | x <- lines xs]
  print s

splitNumbers2 = do 
  xs <- readFile "Day2DB"
  let s = sum [fmod $ map sToInt $ words x | x <- lines xs]
  print s

sToInt x = read x :: Int

diff l = maximum l - minimum l

fmod []     = 0
fmod (x:xs) = (hmod x xs) + (fmod xs)

hmod _ []     = 0
hmod x (y:ys) = if((x `foo` y) - (fromIntegral (x `hquot` y)) == 0.0) then hquot x y else hmod x ys

hquot x y 
  |x  > y = quot x y
  |y >= x = quot y x

foo :: Int -> Int -> Double
foo a b 
  |a  > b = (fromIntegral a) / (fromIntegral b)
  |b >= a = (fromIntegral b) / (fromIntegral a)
