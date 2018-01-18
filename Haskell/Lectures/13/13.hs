import Data.Char
import Data.Functor
import Data.Foldable
import Prelude hiding (foldr,foldl,foldr1)
import qualified Data.Set as S
import qualified Data.Map as M
import qualified Data.Tree as T
import Data.Functor

class Ageing a where
  currentAge :: a -> Int
  maxAge     :: a -> Int
  makeOlder  :: a -> a

data Breed = Beagle | Husky | Pekingese deriving (Eq,Ord,Show,Read)
data Dog = Dog {
  dogName  :: String,
  dogBreed :: Breed,
  dogAge   :: Int } deriving (Eq,Ord,Show,Read)

instance Ageing Dog where
  currentAge  = dogAge
  makeOlder d = d {dogAge = dogAge d + 1}
  maxAge d    = case dogBreed d of 
                  Husky -> 29
                  _     -> 20

data Sex = Male | Female deriving (Show,Read,Eq,Ord)
data Person = Person {
  idNumber :: String,
  forename :: String,
  surname  :: String,
  sex      :: Sex,
  age      :: Int,
  partner  :: Maybe Person,
  children :: [Person] } deriving (Show,Read,Eq,Ord)

instance Ageing Person where
  currentAge = age
  makeOlder p = p {age = age p + 1}
  maxAge    _ = 123

compareRelativeAge :: (Ageing a, Ageing b) => a -> b -> Ordering 
compareRelativeAge a b = (currentAge a `div` maxAge a) `compare`  (currentAge b `div` maxAge b) --Chane to real cuz 0 div

class Pushable t where
  push   :: a -> t a -> t a
  peek   :: t a -> a
  pop    :: t a -> t a

instance Pushable [] where
  push x xs   = x:xs
  peek (x:_)  = x
  peek []     = error "Empty list"
  pop (_:xs)  = xs
  pop []      = error "Empty list"

data MyList a = Empty | Cons a (MyList a) deriving (Show,Read,Eq,Ord)

instance Pushable MyList where
  push x xs          = x `Cons` xs
  peek (x `Cons` _)  = x
  peek Empty         = error "Empty MyList"
  pop  (_ `Cons` xs) = xs
  pop Empty          = error "Empty MyList"

data Tree a = Null | Node a (Tree a) (Tree a) deriving (Show,Eq)

instance Pushable Tree where
  push x t          = Node x t Null
  peek (Node x _ _) = x
  peek Null         = error "Empty Tree"
  pop  (Node _ t _) = t
  pop  Null         = error "Empty Tree"

class Takeable t where 
  takeSome :: Int -> t a -> [a]

instance Takeable [] where
  takeSome n l = take n l

treeToList :: Tree a -> [a]
treeToList Null = []
treeToList t@(Node v r l) = (treeToList r) ++ [v] ++  (treeToList l)

instance Takeable Tree where 
  takeSome _ Null = error "Empty Tree" 
  takeSome n t    = take n $ treeToList t

class Headed t where 
  headOf  :: t a -> a 
  headOff :: t a -> t a

instance Headed [] where 
  headOf l  = head l
  headOff l = tail l

instance Headed Maybe where 
  headOf (Just x) = x
  headOf Nothing  = error "Empty"
  headOff x       = Nothing

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

instance Functor Tree where
  fmap _ Null         = Null
  fmap f (Node x l r) = Node (f x) (fmap f l) (fmap f r)

maybeMap :: (a -> b) -> Maybe a -> Maybe b
maybeMap _ Nothing  = Nothing
maybeMap f (Just x) = Just $ f x

tr = Node (Just 1) (Node (Just 2) Null Null) (Node Nothing Null Null)

mapOnTreeMaybe :: Functor f => (a -> b) -> f (Maybe a) -> f (Maybe b)
mapOnTreeMaybe f tr = fmap (maybeMap f) tr

data RoseTree a = RoseEmpty | RoseTree a [RoseTree a]

--instance Functor RoseTree where 
--  fmap f RoseEmpty     = f RoseEmpty
--  fmap f (RoseTree a rs) = RoseTree (f a) (map f rs)


sumPositive :: (Foldable t, Num a, Ord a) => t a -> a
sumPositive l = foldr (\x y -> if x > 0 then (x+y) else y) 0 l

data Tree3 a = Null3 | Node3 a (Tree3 a) (Tree3 a) (Tree3 a) 
  deriving (Show,Eq)

instance Foldable Tree3 where
  foldr f z Null3           = z
  foldr f z (Node3 x l m r) = f x (foldr f (foldr f (foldr f z r) m) l)

intTree3 = Node3 5
  (Node3 6 Null3 Null3 Null3) 
  (Node3 7 Null3 Null3 Null3) 
  (Node3 8 Null3 Null3 Null3)










