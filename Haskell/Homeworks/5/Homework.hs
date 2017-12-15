module Homework where
--
import Data.List
--

-- Task 01

{-
  Inspect type signatures of functions that you are supposed to implement
  and and from that information try to think of how Robot and Bearing 
  data types should look like.
-}

data Robot = Robot Bearing (Integer, Integer) deriving Show
--(0,1) - N (1,0) - E (0,-1) - S (-1,0) - W
data Bearing = Bearing (Integer, Integer) deriving Show

mkRobot :: Bearing -> (Integer, Integer) -> Robot
mkRobot b (x,y) = Robot b (x, y)

bearing :: Robot -> Bearing
bearing (Robot b _) = b

coordinates :: Robot -> (Integer, Integer)
coordinates (Robot _ (x,y)) = (x, y)

{- It is MANDATORY to implement 'simulate' function in terms of fold -}
simulate :: Robot -> String -> Robot
simulate r s = foldl hSim r s

hSim (Robot b c) 'L' = Robot (turnLeft b) c
hSim (Robot b c) 'R' = Robot (turnRight b) c
hSim (Robot b c) 'A' = Robot b (advance b c)


advance :: Bearing -> (Integer, Integer) -> (Integer, Integer)
advance (Bearing (x,y)) (a,b) = (a + x, b + y)

turnLeft :: Bearing -> Bearing
turnLeft (Bearing (0,1))  = Bearing (-1,0)
turnLeft (Bearing (-1,0)) = Bearing (0,-1)
turnLeft (Bearing (0,-1)) = Bearing (1,0)
turnLeft (Bearing (1,0))  = Bearing (0,1)

turnRight :: Bearing -> Bearing
turnRight (Bearing (0,1))  = Bearing (1,0)
turnRight (Bearing (-1,0)) = Bearing (0,1)
turnRight (Bearing (0,-1)) = Bearing (-1,0)
turnRight (Bearing (1,0))  = Bearing (0,-1)

-- Task 02
data Triangle = Triangle Int Int Int deriving Show
data TriangleType = Equilateral | Isosceles | Scalene | Degenerate | Illegal deriving Show

triangleType :: (Ord a, Num a) => a -> a -> a -> TriangleType
triangleType a b c
  |a < 0 || b < 0 || c < 0               = Illegal 
  |a + b < c || b + c < a || a + c < b   = Illegal
  |a == b && b == c                      = Equilateral
  |a /= b && b /= c                      = Scalene
  |a + b == c || a + c == b || c + b ==a = Degenerate
  |a == b || b == c || c == a            = Isosceles
  |otherwise                             = Illegal

-- Task 03

{- some convenient test examples -}
-- splitter " > " " > " => ["", ""]
-- splitter " > " "123 > " => ["123", ""]
-- splitter " > " "123 > 456 > 789" => ["123", "456", "789"]

{-
  you don't have to bother with splitting on an empty list e.g.:
  splitter "" "abcde" => ["a", "b", "c", "d", "e"]
-}

{- It is MANDATORY to implement 'splitter' function in terms of fold -}
splitter :: Eq a => [a] -> [a] -> [[a]]
splitter = undefined

-- Task 04

{-
  For this task either write a solution to the problem or if you think
  solution doesn't exist explain why that is the case. Of corse, solution
  must use fold.
-}
