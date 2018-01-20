module Homework where
--
import Data.List
import Data.Char
import Data.Function ( fix )
--

-- Task 01

-- non accumulator style
factorial :: (Num a, Eq a) => a -> a
factorial = fix (\rec n -> if n == 0 then 1 else n * rec(n-1)) 

-- non accumulator style
sum' :: Num a => [a] -> a
sum' = fix (\rec ns -> if length ns > 0 then head ns + rec(tail ns) else 0) 

-- accumulator style
factorial' :: (Num a, Eq a) => a -> a
factorial' x = fix (\rec n acc-> if n == 0 then acc else rec (n-1) acc * n) x 1

-- accumulator style
sum'' :: Num a => [a] -> a
sum'' xs = fix (\rec ns acc-> if length ns > 0 then rec (tail ns) (head ns + acc) else acc) xs 0

nats :: [Integer]
nats = fix (\rec n -> n:rec (n+1)) 0

map' :: (a -> b) -> [a] -> [b]
map' f = fix (\rec as -> if length as == 0 then [] else f (head as) : rec (tail as))

zip' :: [a] -> [b] -> [(a, b)]
zip' = fix (\rec as bs -> if length as == 0 || length bs == 0 then [] else (head as, head bs) : rec (tail as) (tail bs))

-- Task 02
-- A
subsets :: Eq a => Int -> [a] -> [[a]]
subsets n xs = hSubsets n $ nub xs

hSubsets :: Eq a => Int -> [a] -> [[a]]
hSubsets n xs@(x:t)
  |n == 0         = [[]]
  |n > length xs  = [[]]
  |n == length xs = [xs]
  |otherwise      = map (x:) (hSubsets (n-1) t) ++ hSubsets n t

--B
partitions :: [a] -> [[[a]]]
partitions []     = error "empty list for partition" 
partitions xs     = hPartitions xs 

hPartitions :: [a] -> [[[a]]]
hPartitions []     = [[]]
hPartitions (x:t)  = xMajor ++ xMinor
  where xMajor = map ([x]:) (hPartitions t)
        xMinor = [(x:ys):yss | (ys:yss) <- hPartitions t]


-- Task 03
permutations' :: [a] -> [[a]]
permutations' xs = filter (not . null) (herm xs $ length xs)

herm :: [a] -> Int -> [[a]]
herm []       _ = []
herm (x:[])   _ = [[x]]
herm (x:y:[]) _ = [x:y:[]] ++ [y:x:[]]
herm _ 0        = []
herm (x:t) n    =  perm (x:) (herm t $ length t) ++ herm (t ++ [x]) (n-1)
  where perm f  = fix (\rec as -> if null as  then [] else f (head as) : rec (tail as))















