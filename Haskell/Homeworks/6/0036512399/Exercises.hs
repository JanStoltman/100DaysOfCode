{-# LANGUAGE NoMonomorphismRestriction #-}
--
module Exercises where
--
import System.Random
import Data.Set
import Data.Char
import Control.Monad
import System.IO
import Data.List
import qualified Data.Text as T
import System.Random
{-
    Here you should provide your solutions to in-class exercises.

    Make sure that ALL FUNCTIONS (including exXXX) have correct TYPE SIGNATURES.

    You should include solutions from following lectures :
    http://www.fer.unizg.hr/_download/repository/puh-2016-lecture-10.lhs
    http://www.fer.unizg.hr/_download/repository/puh-2016-lecture-11.lhs

    DON'T change function names, just remove 'undefined' and write your own
    definition for that function.
-}

{-LECTURE 10-} -- http://www.fer.unizg.hr/_download/repository/puh-2016-lecture-10.lhs

-- EXERCISE 01 =======================================================================
data Sex = Male | Female deriving (Show,Read,Ord,Eq)

data Person2 = Person2 {
  personId2 :: String,
  forename2 :: String,
  surname2  :: String,
  sex2      :: Sex,   --- data Sex = Male | Female deriving (Show,Read,Eq,Ord)
  mother2   :: Maybe Person2,
  father2   :: Maybe Person2,
  partner2  :: Maybe Person2,
  children2 :: [Person2] } deriving (Show,Read,Eq,Ord)

data Tree a = Null | Node a (Tree a) (Tree a) deriving (Show,Eq)
data MyList a = Empty | Cons a (MyList a) deriving (Show,Read,Ord,Eq)


john = Person2 "123" "John" "Doe" Male Nothing Nothing (Just jane) []
jane = Person2 "623" "Jane" "Fox" Female (Just ann) Nothing (Just john) []
ann  = Person2 "343" "Ann"  "Doe" Female Nothing Nothing Nothing [jane]

{-
  1.2.
  - Define a function
    parentCheck :: Person2 -> Bool
    that checks whether the given person is one of the children of its parents.
-}
parentCheck :: Person2 -> Bool
parentCheck p = isEl pm || isEl pf
  where 
    pi      = personId2 p
    pm      = Prelude.map personId2 $ maybe [] children2 $ mother2 p
    pf      = Prelude.map personId2 $ maybe [] children2 $ father2 p
    isEl pr = elem pi pr
{-
  1.3.
  - Define a function
    sister :: Person2 -> Maybe Person2
    that returns the sister of a person, if such exists.
-}

sister :: Person2 -> Maybe Person2
sister p = if si == [] then Nothing else (Just (head si))
  where 
    si = pm ++ pf
    pm = Prelude.filter (\x -> sex2 x == Female && not(personId2 p == personId2 x)) $ maybe [] children2 $ mother2 p
    pf = Prelude.filter (\x -> sex2 x == Female && not(personId2 p == personId2 x)) $ maybe [] children2 $ father2 p

{-
  1.4.
  - Define a function that returns all descendants of a person.
    descendant :: Person2 -> [Person2]
-}

descendant :: Person2 -> [Person2]
descendant p = ds (children2 p) (children2 p)
  where 
    ds [] ys       = ys
    ds (x:xs)  ys  = (ds xs zs) ++ (ds (children2 x) [])
      where 
        zs = ys ++ (children2 x)

-- EXERCISE 02 =======================================================================
l = 1 `Cons` (2 `Cons` (3 `Cons` Empty))
{-
  2.1.
  - Define
    listHead :: MyList a -> Maybe a
-}

listHead :: MyList a -> Maybe a
listHead Empty      = Nothing
listHead (Cons a _) = Just a

{-
  2.2.
  - Define a function that works like 'map' but works on a 'MyList' type:
    listMap :: (a -> b) -> MyList a -> MyList b
-}

listMap :: (a -> b) -> MyList a -> MyList b
listMap _ Empty      = Empty
listMap f (Cons a l) = (Cons (f a) (listMap f l))

-- EXERCISE 03 =======================================================================
{-
  3.1.
  - Define a function
    treeMax :: Ord a => Tree a -> a
    that finds the maximum element in a tree. Return an error if the tree is
    empty.
-}

treeMax :: Ord a => Tree a -> a
treeMax Null = error "Empty tree" 
treeMax t    = hTreeMax t
  where
    hTreeMax (Node a Null Null) = a 
    hTreeMax (Node a Null r)    = a `max` (treeMax r)
    hTreeMax (Node a l Null)    = a `max` (treeMax l)
    hTreeMax (Node a l r)       = a `max` ((treeMax l) `max` (treeMax r))

{-
  3.2.
  - Define a function
    treeToList :: Ord a => Tree a -> [a]
    that will collect in a list all elements from inner nodes of a tree by doing
    an in-order (left-root-right) traversal.
-}

treeToList :: Ord a => Tree a -> [a]
treeToList Null = []
treeToList t@(Node v r l) = (treeToList r) ++ [v] ++  (treeToList l)

{-
  3.3.
  - Define a function to prune the tree at a given level (root has level 0).
    levelCut :: Int -> Tree a -> Tree a
-}

levelCut :: Int -> Tree a -> Tree a
levelCut _ Null         = Null
levelCut n (Node a l r) = if n > 0 then Node a (levelCut (n-1) l) (levelCut (n-1) r) else Null


-- EXERCISE 04 =======================================================================
{-
  4.1.
  - Define a function that converts a list into a sorted tree.
    listToTree :: Ord a => [a] -> Tree a
-}

listToTree :: Ord a => [a] -> Tree a
listToTree []     = Null
listToTree (x:[]) = treeInsert x Null
listToTree (x:xs) = treeInsert x $ listToTree xs

treeInsert :: Ord a => a -> Tree a -> Tree a
treeInsert x Null = Node x Null Null
treeInsert x t@(Node y l r) 
  | x < y     = Node y (treeInsert x l) r
  | x > y     = Node y l (treeInsert x r)
  | otherwise = t

{-
  4.2.
  - Using 'listToTree' and 'treeToList' defined previously, define these two 
    functions, define:
    sortAndNub :: Ord a => [a] -> [a]
-}

sortAndNub :: Ord a => [a] -> [a]
sortAndNub = treeToList . listToTree

-- EXERCISE 05 =======================================================================
{-
  5.1.
  - Define an 'Eq' instance for the 'Weekday' type that works like (==), except
    that two Fridays are never identical.
-}

data Weekday = 
  Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday
  deriving (Show,Enum)

instance Eq Weekday where
  Monday    == Monday    = True
  Tuesday   == Tuesday   = True
  Wednesday == Wednesday = True
  Thursday  == Thursday  = True
  Saturday  == Saturday  = True
  Sunday    == Sunday    = True
  _         == _         = False

{-
  5.2.
  - Define 'Person' as an instance of 'Show' type class so that instead of the
    values of partners and children only the respective person names are shown,
    which will enable the print out of an infinite structure of this type.
-}

data Person = Person
  { idNumber :: String
  , forename :: String
  , surname  :: String
  , sex      :: Sex
  , age      :: Int
  , partner  :: Maybe Person
  , children :: [Person]
  } deriving (Read,Ord,Eq)

instance Show Person where 
  show (Person _ f s _ _ _ _) = (f ++ " " ++ s) 


{-LECTURE 11-} -- http://www.fer.unizg.hr/_download/repository/puh-2016-lecture-11.lhs

-- EXERCISE 01 =======================================================================

{- DON'T FORGET TO WRITE TYPE SIGNATURES-}

{-
  1.1.
  - Define a 'main' function that reads in two strings and prints them out
    concatenated and reversed.
-}

main :: IO ()
main = do
  s1 <- getLine
  s2 <- getLine
  print $ reverse (s1 ++ s2)

{-
  1.2.
  - Write a function 'threeNumbers' that reads in three numbers and prints out
    their sum.
-}
threeNumbers :: IO ()
threeNumbers = do
  s1 <- getLine
  s2 <- getLine
  s3 <- getLine
  print (read s1 + read s2 + read s3)

-- EXERCISE 02 =======================================================================
{-
  2.1.
  - Define a function 'threeStrings' that reads in three strings and outputs them
    to the screen as one string, while it returns its total length.
    treeStrings :: IO Int
-}

treeStrings :: IO Int
treeStrings = do
  s1 <- getLine
  s2 <- getLine
  s3 <- getLine
  print (s1 ++ s2 ++ s3)
  return (length s1 + length s2 + length s3)

{-
  2.2.
  - Define a function 'askNumber9' that reads in a number and returns that number
    converted into an 'Int'. Input should be repeated until the user enters a
    number (a string containing only digits).
      askNumber9 :: IO Int
-}

askNumber9 :: IO Int
askNumber9 = do
  number <- getLine
  if not $ isN number then do
    putStr "Wrong input\n"
    askNumber9 
  else return $ read number 

isN :: String -> Bool
isN s = (length s) == (length $ Prelude.filter (isNumber) s)

{-
  2.3.
  - Define a function 'askUser m p' that returns an action that prints out 'm',
    reads in a string from the input, repeats the input until the input
    string satisfies the function 'p', and then returns the input string.
      askUser :: String -> (String -> Bool) -> IO String
  - Generalize this function to
      askUser' :: Read a => String -> (String -> Bool) -> IO a
-}

askUser :: String -> (String -> Bool) -> IO String
askUser m p = do
  print m
  as
  where 
    as = do
      inp <- getLine
      if not $ p inp then do
        as
      else return inp

--askUser' :: Read a => String -> (String -> Bool) -> IO a
askUser' m p = undefined

{-
  2.4.
  - Define a function that reads in strings until the user inputs an empty
    string, and then returns a list of strings received as input.
      inputStrings :: IO [String]
-}

inputStrings :: IO [String]
inputStrings = hinputStrings []
  where 
    hinputStrings a = do 
      inp <- getLine
      if inp == "" then 
        return a
      else 
        hinputStrings (a ++ [inp])

-- EXERCISE 03 =======================================================================
{-
  3.1.
  - Define a function that reads in a number, then reads in that many
    strings, and finally prints these strings in reverse order.
-}

m31 = do 
  z <- getLine 
  inp <- replicateM (read z) getLine
  print $ reverse inp 
{-
  3.2.
  - Give recursive definitions for 'sequence' and 'sequence_'.
-}



{-
  3.3.
  - Give a recursive definitions for 'mapM' and 'mapM_'.
-}

{-
  3.4.
  - Define a function that prints out the Pythagorean triplets whose all sides
    are <=100. Every triplet should be in a separate line.
-}

-- EXERCISE 04 =======================================================================
{-
  4.1.
  - Define a function that removes from standard input every second line and
    prints the result to standard output.
      filterOdd :: IO ()
-}

filterOdd :: IO ()
filterOdd = do
  s <- getContents
  putStr . unlines $ Prelude.map snd $ Prelude.filter (odd . fst) $ zip [1..] (lines s)

{-
  4.2.
  - Define a function that prefixes each line from standard input with a line
    number (number + space).
      numberLines :: IO ()
-}

numberLines :: IO ()
numberLines = do
  s <- getContents
  putStr . unlines $ Prelude.map f $ zip [1..] (lines s)
  where
        f (x, y) = (show x) ++ " " ++ y

{- 4.3.
  - Define a function to remove from standard input all words from a given set of
    words.
      filterWords :: Set String -> IO ()
-}

filterWords :: Set String -> IO ()
filterWords st = interact(\x -> unwords $ Prelude.filter (\y -> not $ member y st) $ words x)

-- EXERCISE 05 =======================================================================
{-
  5.1.
  - Define a function
    wc :: FilePath -> IO (Int, Int, Int)
    that counts the number of characters, words, and lines in a file.
-}

wc :: FilePath -> IO (Int, Int, Int)
wc f = withFile f ReadMode $ \h -> do
  s <- hGetContents h
  return $ (length s, length $ words s, length $ lines s)

{-
  5.2. 
  - Define a function
    copyLines :: [Int] -> FilePath -> FilePath -> IO ()
    that copies given lines from the first file into the second.
-}

copyLines :: [Int] -> FilePath -> FilePath -> IO ()
copyLines l i o =  withFile i ReadMode $ \h -> do
  s <- hGetContents h
  let ll = zip (lines s) [1..]
  let fl = fst $ unzip $ Prelude.filter (\(_,x) -> elem x l) ll
  writeFile o (unlines fl)
    
  

-- EXERCISE 06 =======================================================================
{-
  6.1.
  - Define a function
      wordTypes :: FilePath -> IO Int
    to compute the number of distinct words in the given file.
-}

wordTypes :: FilePath -> IO Int
wordTypes f = withFile f ReadMode $ \h -> do
  s <- hGetContents h
  return $ length $ nub $ words s

{-
  6.2.
  - Define a function 
      diff :: FilePath -> FilePath -> IO ()
    that takes two file names, compares their corresponding lines, and then
    outputs to standard output all lines in which the files differ. Lines should 
    be printed one below the other, prefixed with "<" for the first and ">" for
    the second file.
-}

diff :: FilePath -> FilePath -> IO ()
diff = undefined

{-
  6.3.
  - Define a function
      removeSpaces :: FilePath -> IO () 
    that removes trailing spaces from all lines in the given file.
    The function should change the original file.
-}

removeSpaces :: FilePath -> IO () 
removeSpaces f = do
  fc <- readFile f
  let sf = T.unlines $ Data.List.map T.strip $ T.lines $ T.pack fc
  writeFile f (T.unpack sf)

-- EXERCISE 07 =======================================================================
{-
  7.1.
  - Define a function
      fileHead :: IO ()
    that prints the first 'n' lines from a file. The name of the file and the
    number of lines are specified at the command line, e.g.:
      filehead -5 input.txt
    If the number of lines is missing, default to 10. If file name is missing,
    read from the standard input. If the file doesn't exist, print an error
    message and exit with failure using 'exitFailure' from 'System.Exit'.
-}

fileHead :: IO ()
fileHead = undefined

{-
  7.2.
  - Define a function
      sortFiles :: IO ()
    that sorts lines from multiple files and prints them to standard output.
    File names are provided at the command line.
    "sortFiles file1.txt file2.txt file3.txt"
    If any of the files does not exist, print an error message.
-}

sortFiles :: IO ()
sortFiles = undefined

-- EXERCISE 08 =======================================================================
{-
  8.1.
  - Define your own implementation of
      randoms' :: (RandomGen g, Random a) => g -> [a]
-}
g = mkStdGen 13


randoms' :: (RandomGen g, Random a) => g -> [a]
randoms' ge = v : (randoms' n)
  where
    (v, n) = random ge :: (a, g)

{-
  8.2.
  - Define a function
      randomPositions :: Int -> Int -> Int -> Int -> IO [(Int,Int)]
    that returns a list of randomly generated integer coordinates from within a
    given interval.
      randomPositions 0 10 0 10 => [(2,1),(4,3),(7,7),...
-}

randomPositions :: Int -> Int -> Int -> Int -> IO [(Int,Int)]
randomPositions = undefined
