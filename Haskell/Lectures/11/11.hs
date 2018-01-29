import Text.Printf
data Tree a = Null | Node a (Tree a) (Tree a) deriving (Show)

treeInsert :: Ord a => a -> Tree a -> Tree a
treeInsert x Null = Node x Null Null
treeInsert x t@(Node y l r) 
  | x < y     = Node y (treeInsert x l) r
  | x > y     = Node y l (treeInsert x r)
  | otherwise = t

treeToList :: Ord a => Tree a -> [a]
treeToList Null = []
treeToList t@(Node v r l) = (treeToList r) ++ [v] ++  (treeToList l)

listToTree :: Ord a => [a] -> Tree a
listToTree []     = Null
listToTree (x:[]) = treeInsert x Null
listToTree (x:xs) = treeInsert x $ listToTree xs

sortAndNub :: Ord a => [a] -> [a]
sortAndNub = treeToList . listToTree


data Sex = Male | Female deriving (Show,Read,Ord,Eq)
data Person = Person {
  idNumber :: String,
  forename :: String,
  surname  :: String,
  sex      :: Sex,
  age      :: Int,
  partner  :: Maybe Person,
  children :: [Person] } deriving (Read,Ord)

instance Eq Person where
  p1 == p2 = idNumber p1 == idNumber p2

instance Show Person where 
  show (Person _ f s _ _ _ _) = printf "%s %s" f s 

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


data MyList a = Empty | Cons a (MyList a) deriving (Show,Read,Ord)

listHead :: MyList a -> Maybe a
listHead Empty      = Nothing
listHead (Cons a _) = Just a

instance Eq a => Eq (MyList a) where 
  Empty    == Empty        = True 
  Cons x _ == Cons y _     = x == y
  _        == _            = False


instance Eq a => Eq (Tree a)
	Null == Null = True
    x    == y    = sortAndNub x == sortAndNub y



















