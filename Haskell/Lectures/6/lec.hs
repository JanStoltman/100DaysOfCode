length' :: [a] -> Int
length' xs = length'' xs 0 
  where length'' [] n       = n
        length'' (y:ys) n   = length'' ys (n+1)


maxUnzip :: [(Int,Int)] -> (Int,Int) 
maxUnzip xs
  |xs == []  = error "Empty list" 
  |otherwise =  maxUnzip' xs (head xs)
    where maxUnzip' [] ac     = ac 
          maxUnzip' (x:xs) ac = maxUnzip' xs (max (fst x) (fst ac), max (snd x) (snd ac))
