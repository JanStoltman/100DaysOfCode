module Homework where
--
import Data.List
import Data.Time.Clock ( UTCTime(..) )
import Data.Time.Calendar ( Day, gregorianMonthLength, fromGregorian)
import Data.Time.Format ( formatTime, defaultTimeLocale )
import Data.Time.Calendar.WeekDate
import Data.Char
--

-- Task 01
data Pred = And Pred Pred| Or Pred Pred | Not Pred | Val Bool
  deriving (Show, Eq)

eval :: Pred -> Bool
eval (Val b)     = b
eval (Not p)     = not $ eval p
eval (Or p1 p2)  = (eval p1) || (eval p2) 
eval (And p1 p2) = (eval p1) && (eval p2) 

-- Task 02

dateFromDescription :: String -> Day
dateFromDescription str = fromGregorian yr mt dy
  where
    dy = traDay wd $ daysInMonth yr mt
    wd = getDay $ trimThe $ words str
    yr = read $ last $ words str :: Integer
    mt = monthToInt $ (reverse $ words str) !! 1

traDay :: (Weekday, Schedule) -> (Int, Weekday) -> Int
traDay (w, Last)   (nd, wd) = findLs w wd nd 1 0
traDay (w, Teenth) (_, wd)  = findTh w wd 1
traDay (w, s)      (_, wd)  = findWD w (fromEnum s) wd 

findLs ::  Weekday -> Weekday -> Int -> Int -> Int -> Int
findLs w wd nd a1 a2 
  |a1 > nd   = a2
  |w == wd   = findLs w (next wd) nd (succ a1) a1
  |otherwise = findLs w (next wd) nd (succ a1) a2  

findTh :: Weekday -> Weekday -> Int -> Int
findTh w wd acc 
  |acc > 12 && w == wd = acc
  |otherwise           = findTh w (next wd) (succ acc)

findWD:: Weekday -> Int -> Weekday -> Int
findWD w 0 wd = if w == wd then 1 else 1 + findWD w 0 (next wd)
findWD w s wd = if w == wd then 1 + findWD w (s - 1) (next wd) else 1 + findWD w s (next wd)

daysInMonth :: Integer -> Int -> (Int, Weekday)
daysInMonth year month = (nd, toEnum(wd - 1) :: Weekday) 
  where 
    nd = gregorianMonthLength year month
    wd = digitToInt $ last $ showWeekDate $ fromGregorian year month 1

trimThe :: [String] -> [String]
trimThe xs = if xs !! 0 == "the" then tail xs else xs

getDay :: [String] -> (Weekday, Schedule)
getDay st = (w, s)
  where
    s = toSched (st !! 0) 
    w = if s == Teenth then toWkday (st !! 0) else toWkday (st !! 1)

data Weekday = Monday
             | Tuesday
             | Wednesday
             | Thursday
             | Friday
             | Saturday
             | Sunday
             deriving (Bounded, Enum, Show, Eq)

data Schedule = First
              | Second
              | Third
              | Fourth
              | Last
              | Teenth
              deriving (Eq, Enum, Show)

toWkday :: String -> Weekday
toWkday "Monday"    = Monday
toWkday "Tuesday"   = Tuesday
toWkday "Wednesday" = Wednesday
toWkday "Thursday"  = Thursday
toWkday "Friday"    = Friday
toWkday "Saturday"  = Saturday
toWkday "Sunday"    = Sunday
toWkday "Monteenth"    = Monday
toWkday "Tuesteenth"   = Tuesday
toWkday "Wednesteenth" = Wednesday
toWkday "Thursteenth"  = Thursday
toWkday "Friteenth"    = Friday
toWkday "Saturteenth"  = Saturday
toWkday "Sunteenth"    = Sunday

toSched :: String -> Schedule
toSched s = hToSched $ map toLower s
  where 
    hToSched "first"  = First
    hToSched "second" = Second
    hToSched "third"  = Third
    hToSched "fourth" = Fourth
    hToSched "last"   = Last
    hToSched _        = Teenth

monthToInt :: String -> Int
monthToInt s
  |s == "January"   = 1
  |s == "February"  = 2
  |s == "March"     = 3
  |s == "April"     = 4
  |s == "May"       = 5
  |s == "June"      = 6
  |s == "July"      = 7
  |s == "August"    = 8
  |s == "September" = 9
  |s == "October"   = 10
  |s == "November"  = 11
  |s == "December"  = 12
  |otherwise        = error "Wrong month name" 


-- Task 03

data Tree a
  = Leaf | Node a (Tree a) (Tree a)
  deriving (Eq, Show)

testTree :: Tree Integer
testTree = Node 1 (Node 2 Leaf Leaf) (Node 3 (Node 4 Leaf Leaf) Leaf)

-- a)
treeFilter :: (a -> Bool) -> Tree a -> Tree a
treeFilter _ Leaf         = Leaf
treeFilter f n@(Node v l r) = if f v then (Node v (treeFilter f l) (treeFilter f r)) else Leaf

-- b)
levelMap :: (Int -> a -> b) -> Tree a -> Tree b
levelMap f t = hLevelMap f t 0
  where 
    hLevelMap _ Leaf _ = Leaf
    hLevelMap f (Node v l r) a = (Node (f a v) (hLevelMap f l (a + 1)) (hLevelMap f r (a + 1)))  

-- c)
isSubtree :: Eq a => Tree a -> Tree a -> Bool
isSubtree t t1@(Node v l r) = if t == t1 then True else False || isSubtree t l || isSubtree t r
isSubtree t l               = t == l

-- Task 04
data Category

parseCategories :: [String] -> [Category]
parseCategories = undefined

printCategories :: [Category] -> [String]
printCategories = undefined


-- Helpers
next :: (Enum a, Bounded a) => a -> a
next = turn 1

prev :: (Enum a, Bounded a) => a -> a
prev = turn (-1)

turn :: (Enum a, Bounded a) => Int -> a -> a
turn n e = toEnum (add (fromEnum (maxBound `asTypeOf` e) + 1) (fromEnum e) n)
    where
      add mod x y = (x + y + mod) `rem` mod
