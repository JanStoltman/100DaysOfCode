{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}

module App where

import Data.Aeson
import GHC.Generics
import Network.Wai.Handler.Warp
import Data.Text
import Data.List
import Servant
import Servant.HTML.Lucid
import Network.HTTP.Media
import System.IO
import Lucid
import Scrapper
import Network.Wreq
import Control.Monad.IO.Class

data HTMLLucid
instance Servant.Accept HTMLLucid where
    contentType _ = "text" // "html" /: ("charset", "utf-8")
instance ToHtml a => MimeRender HTMLLucid a where
    mimeRender _ = renderBS . toHtml
instance MimeRender HTMLLucid (Html a) where
    mimeRender _ = renderBS
instance ToHtml (String,String) where 
  toHtml (n, l) = 
    tr_ $ do
      td_ $ do
       a_ [href_ $ pack l] (toHtml $ n)
  toHtmlRaw = toHtml

data TitleList = TitleList 
  { titles :: [(String,String)]
  } deriving (Show, Eq, Generic)

instance ToJSON TitleList
instance ToHtml TitleList where
  toHtml list = table_ $ do
    tr_ $ do
      th_ "Mangas"
    foldMap toHtml $ Prelude.map ft $ titles list
      where ft (a, b) = (a, "/chapters" ++ b)  
  toHtmlRaw = toHtml

data ChapterList = ChapterList 
  { chapters :: [(String,String)]
  } deriving (Show, Eq, Generic)

instance ToJSON ChapterList
instance ToHtml ChapterList where
  toHtml list = table_ $ do
    tr_ $ do
      th_ "Chapters"
    foldMap toHtml $ Prelude.map fc $ chapters list
      where fc (a, b) = (a, "/page" ++ b ++ "/1")
  toHtmlRaw = toHtml

data Photo = Photo
  { info :: (String, String, String, String, String)
  } deriving (Show, Eq, Generic)

instance ToJSON Photo
instance ToHtml Photo where
  toHtml (Photo (w, h, s, a, l)) = do
    a_ [href_ "javascript:history.go(-1)"] "Prev"
    img_ [src_ $ pack s]
    a_ [href_ $ gns l] "Next" 
  toHtmlRaw = toHtml

gns :: String -> Text
gns s = pack $ show $ l + 1
  where 
    l = read $ unpack $ Prelude.last $ splitOn "/" $ pack s







type MangaAPI = "titles"   :> Get '[HTMLLucid] TitleList 
           :<|> "chapters" :> Capture "title"  String :> Get '[HTMLLucid] ChapterList
           :<|> "page"     :> Capture "title"  String :> Capture "chapter" String :> Capture "page" String :>  Get '[HTMLLucid] Photo

tls :: IO TitleList
tls = do
  ts <- get "http://www.mangareader.net/alphabetical"
  return $ TitleList $ Scrapper.getTitles ts
  
cps :: String -> IO ChapterList
cps n = do
  ts <- get ("http://www.mangareader.net/" ++ n)
  return $ ChapterList $ Scrapper.getChapters ts

img :: String -> IO Photo
img n = do 
  ts <- get l
  return $ Photo $ Scrapper.getImage ts n
  where 
   l = "http://www.mangareader.net/" ++ n

gt :: Handler TitleList
gt = liftIO $ tls 

gc :: MonadIO m => [Char] -> m ChapterList
gc a = liftIO $ cps a

gi :: MonadIO m => [Char] -> [Char] -> [Char] -> m Photo
gi t c p = liftIO $ img $ (t ++ "/" ++ c ++ "/" ++ p)

server :: Server MangaAPI
server = gt 
    :<|> gc
    :<|> gi

mangaAPI :: Servant.Proxy MangaAPI
mangaAPI = Servant.Proxy

app1 :: Application
app1 = serve mangaAPI server

main :: IO()
main = do
  let port = 8081
  run 8081 app1 




