import Data.List
main = do
  text <- readFile "Day4DB"
  let ls = lines text
  let n = length $ filter (\x -> (length $ words x) == (length $ nub $ map (\y -> sort y) $ words x)) ls
  return n
