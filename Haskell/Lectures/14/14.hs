import Data.List
import Data.Char
import Control.Monad
import Data.Maybe
import System.Environment 
import System.IO 

data Sex = Male | Female deriving (Show,Read,Eq,Ord)
data Person = Person {
  forename :: String,
  surname  :: String,
  sex      :: Sex,
  mother   :: Maybe Person,
  father   :: Maybe Person,
  partner  :: Maybe Person,
  children :: [Person] } deriving (Show,Read,Eq,Ord)

 
pero  = Person "Pero" "Perić" Male    (Just ana) Nothing (Just tea)    [] 
ana   = Person "Ana"  "Anić"  Female  (Just tea) (Just ivo) Nothing    [pero] 
tea   = Person "Tea"  "Teić"  Female  Nothing    Nothing (Just ivo) [ana] 
ivo   = Person "Ivo"  "Ivić"  Male    Nothing    (Just pero) (Just tea) [ana]

grandmothersPartner :: Person -> Maybe Person
grandmothersPartner p = case mother p of
  Just m -> case mother m of
    Just g  -> partner g
    Nothing -> Nothing
  Nothing -> Nothing

partnersForename :: Person -> Maybe String
partnersForename p = case partner p of
  Just p  -> Just $ forename p
  Nothing -> Nothing


grandfathersPartnerForename :: Person -> Maybe String
grandfathersPartnerForename p = father p >>= father >>= partner >>= return . forename

stripSuffix :: Eq a => [a] -> [a] -> Maybe [a]
stripSuffix xs ys = (stripPrefix (reverse xs) $ reverse ys) >>= return . reverse 

removeAffixes :: String -> String -> String -> Maybe String
removeAffixes pr af xs = undefined 

grandfathersPartnerForename2 :: Person -> Maybe String
grandfathersPartnerForename2 p = do 
  f   <- father p 
  gf  <- father f
  pr  <- partner gf
  return $ forename pr

main5 :: IO()
main5 = getArgs >>= z >>= getContents >>= putStr . unlines . sort . lines 
  where 
    z = case xs of
      (f:_) -> do 
                  e <- doesFileExist f
                  if e then openFile f ReadMode else return stdin
      []    -> return stdin
