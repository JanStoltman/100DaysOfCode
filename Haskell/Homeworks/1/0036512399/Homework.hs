module Homework where
--
import Data.List
import Data.Char
--

-- Task 01
isLeapYear :: Int -> Bool
isLeapYear y = y `mod` 4 == 0 && (y `mod` 100 /= 0 || y `mod` 400 == 0) 

leapList :: [Int]
leapList = [c|c <- [1996 .. 2017], isLeapYear c]


-- Task 02
evaluate :: Double -> [Double] -> Double
evaluate x a = sum [c*(x^i) | (i,c) <- l] 
                  where l = zip [0..] a 

factorial :: Double -> Double
factorial 0 = 1
factorial x = if x < 0 then error "Negative number" else x * factorial (x-1)

maclaurin :: [Double]
maclaurin = [1/(factorial c) | c <- [0..]]

exp' :: Double -> Double
exp' x = sum [(x^i) * n | (n,i) <- l]
                where l = zip maclaurin [0..170]


-- Task 03
findItem :: [(String, a)] -> String -> [(String, a)]
findItem l k = [c| c <- l , fst c == k]

contains :: [(String, a)] -> String -> Bool
contains l k = not $ null $ findItem l k

lookup :: [(String, a)] -> String -> a
lookup l k = if contains l k then snd $ head $ findItem l k else error "I’m an error message"

insert :: [(String, a)] -> (String, a) -> [(String, a)]
insert l e = if contains l (fst e) then l else l ++ [e]

remove :: [(String, a)] -> String -> [(String, a)]
remove l k = if contains l k then [c|c<-l, fst c /= k] else l

update :: [(String, a)] -> String -> a -> [(String, a)]
update l k v 
  | null l = []
  | (fst $ head l) == k = (k,v) : (tail l)
  | otherwise = head l : update (tail l) k v


-- Task 04
cosineSimilarity :: String -> String -> Double
cosineSimilarity s1 s2
  |null s1 && null s2 = 1.0
  |null s1 || null s2 = 0.0
  |otherwise = if isNaN v then 0.0 else v 
    where v = cosine (stringToVec s1) (stringToVec s2)

--Cosine helpers
cosine :: [(String,Int)] -> [(String,Int)] -> Double
cosine v1 v2 = (dotProd v1 v2) /((magnitude v1) * (magnitude v2)) 

magnitude :: [(String,Int)] -> Double
magnitude xs = sqrt $ fromIntegral $ sum [v^2 | (k,v) <- xs]

dotProd :: [(String,Int)] -> [(String,Int)] -> Double
dotProd xs ys = if length xs > length ys then dot xs ys else dot ys xs
    where dot xs ys = fromIntegral $ sum [v1 * (lookup0 ys k) | (k,v1) <- xs]

--Words dictionary helpers
stringToVec :: String -> [(String, Int)]
stringToVec s = createWordsDict ([cleanString c| c<-words s])

createWordsDict :: [String] -> [(String, Int)]
createWordsDict xs = hCreateWordsDict xs []

hCreateWordsDict :: [String] -> [(String, Int)] -> [(String, Int)]
hCreateWordsDict xs xv
  |null xs = xv
  |otherwise = if contains xv (head xs) then hCreateWordsDict (tail xs) (incrWordVal xv $ head xs) else hCreateWordsDict (tail xs) (Homework.insert xv (head xs, 1))

incrWordVal :: [(String, Int)] -> String -> [(String, Int)]
incrWordVal xv k = update xv k ((Homework.lookup xv k) + 1)

cleanString :: String -> String
cleanString s = [toLower c | c <- s, (isLetter c) || (isSpace c)]

--Dictionary helper function returning 0 in steadof error for unknown element
lookup0 :: [(String, Int)] -> String -> Int
lookup0 l k = if contains l k then snd $ head $ findItem l k else 0




