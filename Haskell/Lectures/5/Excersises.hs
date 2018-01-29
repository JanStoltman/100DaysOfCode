product' :: Num a => [a] -> a
product' []     = 1
product' (x:xs) = x * product' xs

headsOf :: [[a]] -> [a]
headsOf []          = []
headsOf ([]:xss)    = headsOf xss
headsOf ((x:_):xss) = x : headsOf xss

modMult :: Integral a => a -> a -> [a] -> [a]
modMult n m [] = []
modMult n m (x:xs) = (x*(n `mod` m)) : (modMult n m xs)

addPredecessor :: Num a => [a] -> [a] 
addPredecessor xs = aad 0 xs
  where aad _ [] = []
        aad n (x:xs) = x + n : aad x xs

equalTriplets :: Eq a => [(a,a,a)] ->  [(a,a,a)]
equalTriplets [] = []
equalTriplets ((x,y,z):xs) | x == y && y == x = (x,y,z) : equalTriplets xs 
                           |otherwise = equalTriplets xs 

replicate' :: Int -> a -> [a]
replicate' 0 _  = []
replicate' x y  = y : replicate' (pred x) y

drop' :: Int -> [a] -> [a]
drop' n xs 
  |n<0 = drop'' (-n) (reverse xs)
  |otherwise = drop'' n xs
  where drop'' 0 xs     = xs
        drop'' _ []     = []
        drop'' n (x:xs) = drop' (n-1) xs

--TO-CHANGE N1,N2 negative and N1 > N2 
takeFromTo :: Int -> Int -> [a] -> [a]
takeFromTo n1 n2 xs 
  |n1 > n2   = error "N1 bigger then N2" 
  |otherwise = take (n2 - n1 + 1) (drop n1 xs) 

eachThird :: [a] -> [a]
eachThird (x:y:z:xs) = z : eachThird(xs)
eachThird _ = []

crossZip :: [a] -> [b] -> [(a,b)]
crossZip (x:y:xs) (z:w:ys) = [(x,w)] ++ [(y,z)] ++ crossZip xs ys
crossZip _ _ = []
