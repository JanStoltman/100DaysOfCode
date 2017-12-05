distC p = dist (0,0) p

dist (p1,p2) (q1,q2) = abs(p1-q1) + abs(p2-q2)

potLev n = (2*n -1)^2
levNum n = (2*n -1)^2 - (2*(n-1) -1)^2

lev x = hlev x 1
  where hlev x n = if(x > (2*n -1)^2) then hlev x (n+1) else n

mid n  = potLev n - (quot ((quot (levNum n) 4) - 1) 2) - 1
midT n = hmidT n (mid n) $ quot (levNum n) 4 
  where hmidT sn n m
          |n <= 0           = []
          |n < levNum(sn-1) = []
          |otherwise        = n : hmidT sn (n - m) m 

spiral 1 = 0
spiral n = distC (lev n - 1, getCoor n)

getCoor n = minimum $ map (\x -> abs(x - n)) $ midT $ lev n



