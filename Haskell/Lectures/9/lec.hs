import Data.Char 
import Prelude
import Data.List
import Control.Monad
import Data.Ord (comparing) 

elem' a = foldr (\x acc -> a == x || acc) False  

reverse' :: [a] -> [a]
reverse' = foldr (\x acc -> acc ++ [x]) []

nubRuns xs = foldr (\x acc -> if x == head acc then acc else x:acc) ([last xs]) xs

reverse'' :: [a] -> [a]
reverse'' = foldl (\acc x -> x : acc) [] 

sumEven :: [Integer] -> Integer
sumEven (x:xs) = snd $ foldl (\(i,acc) x -> if(i `mod` 2 == 0) then (i+1,acc+x) else (i+1, acc)) (0,0) xs

maxUnzip :: [(Int,Int)] -> (Int, Int)
maxUnzip []   = error "Empty list"
maxUnzip (x:xs) = foldl (\(a,b) (x,y) -> (a `max` x, b `max` y)) x xs
