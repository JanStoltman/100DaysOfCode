import Data.List


start :: [Int] -> [Int]
start ns = hmain ns []

hmain :: [Int] -> [Int] -> [Int]
hmain ns acc = if length nacc == length acc then elem else hmain elem nacc
  where elem = trasforme ns
        nacc = nub $ acc ++ elem

trasforme :: [Int] -> [Int]
trasforme e = htrans e mv mi
  where mv = maximum e 
        mi = elemIndex mx e
        re = replaceNth mi 0 e

htrans :: [Int] -> Int -> Maybe Int -> [Int]
htrans e@(x:xs) maxV maxVI = undefined

replaceNth n newVal (x:xs)
     | n == 0 = newVal:xs
     | otherwise = x:replaceNth (n-1) newVal xs
