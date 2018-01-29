import Data.Char 
import Prelude
import Data.List
import Control.Monad
import Data.Ord (comparing) 

sumEven xs = undefined
filterWords ws s = undefined 
initials3 d p s = undefined

maxDiff xs = maximum . map (abs . uncurry (-)) . zip xs $ tail xs

elem' a = foldr (\x acc -> a == x || acc) False  

reverse' :: [a] -> [a]
reverse' = foldr (\x acc -> acc ++ [x]) []

nubRuns xs = foldr (\x acc -> if x == head acc then acc else x:acc) ([last xs]) xs
