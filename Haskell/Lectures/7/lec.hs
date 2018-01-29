import Data.Char
import Prelude hiding (map, filter)
import Data.List 

takeThree    :: [a] -> [a]
takeThree    = take 3
dropThree    :: [a] -> [a]
dropThree    = drop 3
hundredTimes :: a -> [a]
hundredTimes = (100 `replicate`)

index  :: [a] -> [(Int,a)]
index  = zip [0..] 
index' :: [a] -> [(a,Int)]
index' = (`zip`[0..])

divider :: Int -> String
divider n = n `replicate` '='

applyOnLast :: (a -> a -> b) -> [a] -> [a] -> b
applyOnLast f xs ys = (last xs) `f` (last ys)

addThree :: Num a => a -> a -> a -> a
addThree x y z = x + y + z

lastTwoPlus100 :: [Integer] -> [Integer] -> Integer
lastTwoPlus100 xs ys = applyOnLast (addThree 100) xs ys

applyManyTimes :: Int -> (a -> a) -> a -> a
applyManyTimes n f x 
  |n <= 0    = x
  |otherwise = applyManyTimes (n-1) f (f x) 

applyTwice :: (a -> a) -> a -> a
applyTwice f x = applyManyTimes 2 f x

listifylist :: [a] -> [[a]]
listifylist = map (:[]) 

cutoff :: Int -> [Int] -> [Int]
cutoff n = map (cut n)
  where cut n x
          |x > n = n
          |otherwise = x

sumEvenSquares xs = sum $ map (^2) xs

freq x xs = length $ filter (==x) xs

withinInterval n m xs = filter (\x -> x >= n && x<= m) xs

sndColumn m = map (\(_:x:_) -> x) $ filter (\x -> (length x) >= 2) m

canoinicalizePairs xs = map (\(x,y) -> (x `min` y, x `max` y)) $ filter (\(x,y) -> x /= y) xs
