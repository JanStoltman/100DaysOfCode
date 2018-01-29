import Data.List
data Date = Date Int Int Int

showDate :: Date -> String
showDate (Date d m y) = show d ++ "." ++ show m ++ "." ++ show y

data Point = Point Double Double 
  deriving Show

data Shape2 = Circle2 Point Double | Rectangle2 Point Point 
  deriving Show

translate (Point px py) (Circle2 (Point ppx ppy) r) = Circle2 (Point (ppx + px) (ppy + py))
translate (Point px py) (Rectangle2 (Point px1 py1) (Point px2 py2)) = undefined
--Rectangle2 ((Point (px1 + px) (py1 + py)) (Point (px2 + px) (py2 + py)))


data Level    = Bachelor | Master | PhD deriving (Show, Eq)

data Student = Student
 { firstName  :: String
 , lastName   :: String
 , studentId  :: String
 , level      :: Level
 , avgGrade   :: Double } deriving Show

--avgGradePerLevels :: [Student] -> (Double, Double, Double)
avgGradePerLevels xs = (avGr b, avGr m, avGr p)
  where b = filter (\x -> level x == Bachelor) xs
        m = filter (\x -> level x == Master) xs
        p = filter (\x -> level x == PhD) xs 

avGr b = (sum $ map (\x -> avgGrade x) b) / genericLength b
