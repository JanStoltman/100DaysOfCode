module Homework where
--
import Data.List
import Data.Char
import Data.Bits ( xor )
--

-- Task 01
localMaxima :: [Int] -> [Int]
localMaxima xs = reverse $ hLocalMaxima xs []
  where hLocalMaxima (x:y:z:xs) acc 
          |y > z && y >x = hLocalMaxima (y:z:xs) (y:acc)
          |otherwise     = hLocalMaxima (y:z:xs) acc
        hLocalMaxima _ acc = acc

-- Task 02
transform :: [(Int, String)] -> [(Char, Int)]
transform []         = []
transform ((n,s):xs) = (reverse $ hTransform s n []) ++ (transform xs)
  where hTransform [] n acc     = acc
        hTransform (x:xs) n acc = hTransform xs n ((x,n):acc)

-- Task 03
rule90 :: [Bool] -> [[Bool]]
rule90 xs = hRule90 xs
  where hRule90 [] = []
        hRule90 xs = xs : (hRule90 $ rule90Step xs)

rule90Step :: [Bool] -> [Bool]
rule90Step xs = hRule90Step ([False] ++ xs ++ [False]) []
  where hRule90Step (x:y:z:xs) acc = hRule90Step (y:z:xs) $ acc ++ [rule90Transform (x:y:z:[])]
        hRule90Step _ acc          = acc

rule90Transform :: [Bool] -> Bool 
rule90Transform (x:_:z:_)    = xor x z
rule90Transform _            = error "Not 3 element array" 

pretty :: [[Bool]] -> String
pretty xss = concat $ map prettyString xss
  where prettyString xs = (map boolToChar xs) ++ ['\n']
          where boolToChar True  = '#'
                boolToChar False = ' '

-- Task 04
f :: [String]
f = createList "1"
  where createList xs = xs : (createList $ generate xs)

generate :: String -> String
generate "" = ""
generate xs = (show $ length $ takeWhile (== head xs) xs) ++ 
                  [head xs] ++ 
                  generate (dropWhile (== head xs) xs)

