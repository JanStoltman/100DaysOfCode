{-# LANGUAGE NoMonomorphismRestriction #-}
--
module Exercises where
--
import Data.List
import Data.Char
--

{-
    Here you should provide your solutions to in-class exercises.
    
    Make sure that ALL FUNCTIONS (including exXXX) have correct TYPE SIGNATURES.
    
    You should include solutions from following lectures :
    - http://www.fer.unizg.hr/_download/repository/puh-2016-lecture-04.lhs
    - http://www.fer.unizg.hr/_download/repository/puh-2016-lecture-05.lhs

    DON'T change function names, just remove 'undefined' and write your own
    definition for that function.
-}

{-LECTURE 04-} -- http://www.fer.unizg.hr/_download/repository/puh-2016-lecture-04.lhs

-- EXERCISE 01 =======================================================================

-- Define 'headHunter xss' that takes the head of the first list element. If 
-- the first element has no head, it takes the head of the second element.
-- If the second element has no head, it takes the head of the third element.
-- If none of this works, the function returns an error.
ex411 :: [[a]] -> a
ex411 = headHunter
headHunter :: [[a]] -> a
headHunter []            = error "Empty list"
headHunter ((x:_):_)     = x
headHunter (_:(x:_):_)   = x
headHunter (_:_:(x:_):_) = x
headHunter otherwise     = error "None of that worked" 

-- Define 'firstColumn m' that returns the first column of a matrix.
-- firstColumn [[1,2],[3,4]] => [1,3]
-- Check what happens if the input is not a valid matrix.
ex412 :: [[a]] -> [a]
ex412 = firstColumn
firstColumn :: [[a]] -> [a]
firstColumn []         = []
firstColumn ((x:_):xs) = x : firstColumn xs

-- Define 'shoutOutLoud' that repeats three times the initial letter of each
-- word in a string.
-- shoutOutLoud :: String -> String
-- shoutOutLoud "Is anybody here?" => "IIIs aaanybody hhhere?"
ex413 :: String -> String
ex413 = shoutOutLoud
shoutOutLoud :: String -> String
shoutOutLoud xs        = hShoutOutLoud $ words xs

hShoutOutLoud []       = []
hShoutOutLoud (xs:[])  = [head xs] ++ [head xs] ++ xs
hShoutOutLoud (xs:xss) = [head xs] ++ [head xs] ++ xs ++ " " ++  hShoutOutLoud xss

-- EXERCISE 02 =======================================================================

-- Define 'pad' that pads the shorter of two the strings with trailing spaces 
-- and returns both strings capitalized.
-- pad :: String -> String -> (String, String)
-- pad "elephant" "cat" => ("Elephant", "Cat     ")
ex421 :: String -> String -> (String, String)
ex421 = pad
pad :: String -> String -> (String, String)
pad a b 
  | la == lb  = (a,b) 
  | la >  lb  = (a, b ++ [' ' | _ <-[0..diff]])
  | la <  lb  = (a    ++ [' ' | _ <-[0..diff]],b)
  where la   = length a
        lb   = length b
        diff = abs(la - lb)

-- Define 'quartiles xs' that returns the quartiles (q1,q2,q3) of a given list.
-- The quartiles are elements at the first, second, and third quarter of a list
-- sorted in ascending order. (You can use the built-int 'splitAt' function and
-- the previously defined 'median' function.)
-- quartiles :: [Int] -> (Double,Double,Double)
-- quartiles [3,1,2,4,5,6,8,0,7] => (1.5, 4.0, 6.5)
ex422 :: [Int] -> (Double,Double,Double)
ex422 = quartiles
quartiles :: [Int] -> (Double,Double,Double)
quartiles xs = (median $ fst $ splitAt (div (length l) 2) l,
                median l, 
                median $ snd $ splitAt ((div (length l) 2)+1) l)
  where l  = sort xs

median :: (Integral a, Fractional b) => [a] -> b
median [] = error "median: Empty list"
median xs 
  | odd l     = realToFrac $ ys !! h
  | otherwise = realToFrac (ys !! h + ys !! (h-1)) / 2
  where l  = length xs
        h  = l `div` 2
        ys = sort xs

-- EXERCISE 03 =======================================================================

-- Redo Exercise 2 using 'let' instead of 'where'.
ex431 :: String -> String -> (String, String)
ex431 = pad'
pad' :: String -> String -> (String, String)
pad' a b  = 
  let  la   = length a
       lb   = length b
       diff = abs(la - lb)

  in      if la == lb  then (a,b) 
     else if la >  lb  then (a, b ++ [' ' | _ <-[0..diff]])
     else                   (a    ++ [' ' | _ <-[0..diff]],b)

ex432 :: [Int] -> (Double,Double,Double)
ex432 = quartiles'
quartiles' :: [Int] -> (Double,Double,Double)
quartiles' xs = let l = sort xs
  in  (median $ fst $ splitAt (div (length l) 2) l,
       median l, 
       median $ snd $ splitAt ((div (length l) 2)+1) l) 

-- EXERCISE 04 =======================================================================

-- Write a function that takes in a pair (a,b) and a list [c] and returns the
-- following string:
-- "The pair [contains two ones|contains one one|does not contain a single one]
-- and the second element of the list is <x>"
ex441 :: (Num a,Eq a, Show c) => (a,a) -> [c] -> String
ex441 y xs = "The pair " ++ case y of 
  (1,1) -> "contains two ones "
  (_,1) -> "contains one one "
  (1,_) -> "contains one one "
  (_,_) -> "does not contain a single one " 
  ++ case xs of
  (_:z:zs) -> "and the second element of the list is " ++ show z
  _ -> "and there is no second element of the list"
  

{-LECTURE 05-} -- http://www.fer.unizg.hr/_download/repository/puh-2016-lecture-05.lhs

-- EXERCISE 01 =======================================================================

-- Define a recursive function to compute the product of a list of elements.
-- product' :: Num a => [a] -> a
ex511 :: Num a => [a] -> a
ex511 = product'
product' :: Num a => [a] -> a
product' []     = 1
product' (x:xs) = x * product' xs

-- Define a recursive function 'headsOf' that takes a list of lists and
-- returns a list of their heads.
-- headsOf :: [[a]] -> [a]
-- headsOf [[1,2,3],[4,5],[6]] => [1,4,6]
ex512 :: [[a]] -> [a]
ex512 = headsOf
headsOf :: [[a]] -> [a]
headsOf []           = []
headsOf ((x:xs):xss) = x : headsOf xss

-- EXERCISE 02 =======================================================================

-- Define a recursive function 'modMult n m xs' that multiplies each element of
-- a list 'xs' with 'n' modulo 'm'.
ex521 :: Integral a => a -> a -> [a] -> [a]
ex521 = modMult
modMult :: Integral a => a -> a -> [a] -> [a]
modMult _ _ []     = []
modMult n m (x:xs) = (x * (n `mod` m)) : modMult n m xs

-- Define a function 'addPredecessor' that adds to each element of a list the
-- value of the preceding element. The first element gets no value added.
-- addPredecessor :: Num a => [a] -> [a]
-- addPredecessor [3,2,1] => [3,5,3]
ex522 :: Num a => [a] -> [a]
ex522 = addPredecessor
addPredecessor :: Num a => [a] -> [a]
addPredecessor (x:xs) = x :  hAddPredecessor x xs

hAddPredecessor :: Num a => a -> [a] -> [a]
hAddPredecessor _ []     = []
hAddPredecessor y (x:xs) = (x + y) : hAddPredecessor x xs


-- EXERCISE 03 =======================================================================

-- Define 'equalTriplets' that filters from a list of triplets (x,y,z) all
-- triplets for which x==y==z.
-- equalTriplets [(1,2,3),(2,2,2),(4,5,6)] => [(2,2,2)]
ex531 :: Eq a => [(a,a,a)] -> [(a,a,a)]
ex531 = equalTriplets
equalTriplets :: Eq a => [(a,a,a)] -> [(a,a,a)]
equalTriplets []    = []
equalTriplets (a@(x,y,z):xs) 
  |x == y && y == z = a : equalTriplets xs 
  |otherwise        = equalTriplets xs

-- Define your own version of the replicate function:
-- replicate' :: Int -> a -> [a]
ex532 :: Int -> a -> [a]
ex532 = replicate'
replicate' :: Int -> a -> [a]
replicate' 0 _ = []
replicate' n x = x : replicate' (n-1) x

-- EXERCISE 04 =======================================================================

-- Define your own recursive version of the drop function:
-- drop' :: Int -> [a] -> [a].
-- Define drop'' (a wrapper function) so that for n < 0 the function drops
-- the elements from the end of the list. You can use 'reverse'.
ex541 :: Int -> [a] -> [a]
ex541 = drop'
drop' :: Int -> [a] -> [a]
drop' n xs 
  |n >= 0 = drop'' n xs
  |n  < 0 = reverse (drop'' (abs n) (reverse xs))


ex541' :: Int -> [a] -> [a]
ex541' = drop''
drop'' :: Int -> [a] -> [a]
drop'' _ []     = []
drop'' 0 xs     = xs
drop'' n (x:xs) = drop'' (n-1) xs

-- Define a recursive function 'takeFromTo n1 n2 xs'.
-- takeFromTo :: Int -> Int -> [a] -> [a]
ex542 :: Int -> Int -> [a] -> [a]
ex542 = takeFromTo
takeFromTo :: Int -> Int -> [a] -> [a]
takeFromTo n1 n2 xs 
  |n1 > n2   = error "N1 bigger then N2" 
  |otherwise = take (n2 - n1 + 1) (drop n1 xs) 
-- EXERCISE 05 =======================================================================

-- Define a recursive function 'eachThird' that retains every third element
-- in a list.
-- eachThird :: [a] -> [a]
-- eachThird "zagreb" => "gb"
ex551 :: [a] -> [a]
ex551 = eachThird
eachThird :: [a] -> [a]
eachThird (_:_:z:xs) = z : eachThird(xs)
eachThird _          = []

-- Define a recursive function 'crossZip' that zips two lists in a "crossing"
-- manner:
-- crossZip [1,2,3,4,5] [4,5,6,7,8] => [(1,5),(2,4),(3,7),(4,6)]
ex552 :: [a] -> [b] -> [(a,b)]
ex552 = crossZip
crossZip :: [a] -> [b] -> [(a,b)]
crossZip (x:y:xs) (z:w:ys) = [(x,w)] ++ [(y,z)] ++ crossZip xs ys
crossZip _ _               = []

-- EXERCISE 06 =======================================================================

-- Write an accumulator-style recursive definition of
-- length' :: [a] -> Int
ex561 :: [a] -> Int
ex561 = length'
length' :: [a] -> Int
length' xs = length'' xs 0 
  where length'' [] n       = n
        length'' (y:ys) n   = length'' ys (n+1)


-- Write an accumulator-style recursive definition of
--     maxUnzip :: [(Int, Int)] -> (Int, Int)
-- that returns the maximum element at the first position and the maximum
-- element at the second position in a pair, i.e., it's equivalent to:
--     maxUnzip zs = (maximum xs, maximum ys)
--         where (xs,ys) = unzip zs
-- If the list is empty, return an "empty list" error.
-- Now write a standard recursive definition maxUnzip' (without an accumulator).
ex562 :: [(Int, Int)] -> (Int, Int)
ex562 = maxUnzip
maxUnzip :: [(Int, Int)] -> (Int, Int)
maxUnzip [] = error "empty list"
maxUnzip (x:xs) = hMaxUnzip (fst x) (snd x) xs 
  where hMaxUnzip y z []     = (y,z)
        hMaxUnzip y z (x:xs) = hMaxUnzip (y `max` (fst x)) (z `max` (snd x)) xs

ex562' :: [(Int, Int)] -> (Int, Int)
ex562' = maxUnzip'
maxUnzip' :: [(Int, Int)] -> (Int, Int)
maxUnzip' (x:[]) = x
maxUnzip' (x:xs) = ((fst x) `max` (fst z), (snd x) `max` (snd z))
  where z = maxUnzip' xs



































