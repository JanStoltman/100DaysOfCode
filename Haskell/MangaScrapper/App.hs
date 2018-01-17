{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE TypeOperators #-}

module App where

import Control.Monad.Trans.Except
import Data.Aeson
import GHC.Generics
import Network.Wai
import Network.Wai.Handler.Warp
import Servant
import Servant.HTML.Lucid
import System.IO
import Scrapper
import Network.Wreq
import Control.Monad.IO.Class

-- * api
data TitleList = TitleList 
  { titles :: [(String,String)]
  } deriving (Show, Eq, Generic)

instance ToJSON TitleList
instance ToHtml TitleList where
  toHtml titleList =
    table_ $ do
      tr_ $ do
        td_ (toHtml $ titles titleList)

  toHtmlRaw = toHtml

data ChapterList = ChapterList 
  { chapters :: [(String,String)]
  } deriving (Show, Eq, Generic)

instance ToJSON ChapterList

data Photo = Photo
  { info :: (String, String, String, String)
  } deriving (Show, Eq, Generic)

instance ToJSON Photo

type MangaAPI = "titles"   :> Get '[JSON, HTMLLucid] TitleList 
           :<|> "chapters" :> Capture "title"  String :> Get '[JSON] ChapterList
           :<|> "page"     :> Capture "title"  String :> Capture "chapter" String :> Capture "page" String :>  Get '[JSON] Photo

tls = do
  ts <- get "http://www.mangareader.net/alphabetical"
  return $ TitleList $ Scrapper.getTitles ts
  
cps n = do
  ts <- get ("http://www.mangareader.net/" ++ n)
  return $ ChapterList $ Scrapper.getChapters ts

img n = do 
  ts <- get ("http://www.mangareader.net/" ++ n)
  return $ Photo $ Scrapper.getImage ts

gt = liftIO $ tls 
gc a = liftIO $ cps a
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




