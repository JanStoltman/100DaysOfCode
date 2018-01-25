import Data.List
import Control.Monad
import Data.Maybe
import System.Random

data SM s a = SM (s -> (s, a))

instance Functor (SM s) where
  fmap f (SM a) = SM $ \s -> let (s', a') = a s in (s', f a') 

instance Applicative (SM s) where
  pure a = SM (\s -> (s,a))
  SM f <*> (SM a) = SM $ \s -> 
    let (s',f') = f s
        (s'', a') = a s'
    in (s'', f' a')

instance Monad (SM s) where

  return a = SM (\s -> (s, a)) 
  
  SM sm0 >>= fsm1 = SM $ \s0 ->
    let (s1,a1) = sm0 s0  -- left computation on the state
        SM sm1 = fsm1 a1  -- the computation of the "right monad"
        (s2,a2) = sm1 s1  -- right computation on the state
    in (s2,a2)

inc :: SM Int ()
inc = SM (\s -> (s+1, ()))

dec :: SM Int ()
dec = SM (\s -> (s-1, ()))

foo :: SM Int ()
foo = inc >> inc >> inc

runSM :: SM s a -> s -> a
runSM (SM sm0) = snd . sm0

foo2 :: SM Int Int
foo2 = do
  x <- get
  set $ x + 5
  get

runSM' :: SM s a -> s -> (s, a)
runSM' (SM sm0) s0 = sm0 s0     -- can we make this shorter?

v1 = runSM' foo 10
v2 = runSM' (dec >> inc >> dec) 0
v3 = runSM foo 10
get :: SM s s
get = SM (\s -> (s, s))

v4 = runSM (foo >> get) 10
set :: s -> SM s ()
set a = SM (\_ -> (a, ()))

v5 = runSM (set 5) 10
v6 = runSM (set 5 >> get) 10
v7 = runSM (set 5 >> inc >> get) 10
v8 = runSM (get >>= set) 10
v9 = runSM (get >>= set >> get) 10
v10 = runSM (return 0 >> inc >> get) 10
v11 = runSM (get >> return 5) 10
v12 = runSM (inc >> return 0) 10
v13 = runSM (dec >> return 0 >> get) 10
v14 = runSM (get >>= set . (+5) >> get) 10
v15 = runSM foo2 10


nop :: SM s ()
nop   = SM (\s -> (s,()))
nop'  = undefined
nop'' = undefined
reset :: SM Int ()
reset = SM (\_ -> (0,()))
update :: (s -> s) -> SM s ()
update f = SM (\s -> (f s,()))

























