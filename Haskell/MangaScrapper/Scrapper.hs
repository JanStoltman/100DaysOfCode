{-# LANGUAGE OverloadedStrings #-}

module Scrapper where 

import Text.HTML.Scalpel.Core
import Control.Applicative
import Network.Wreq
import Data.Aeson.Lens (_String, key)
import Control.Lens
import Data.ByteString.Lazy.Char8 as Char8
import Data.Maybe

getTitles :: Response ByteString -> [([Char], [Char])]
getTitles r = Prelude.concat $ fromJust $ scalpTitles $ Char8.unpack $ r ^. responseBody

getChapters :: Response ByteString -> [([Char], [Char])]
getChapters r = Prelude.concat $ fromJust $ scalpChapters $ Char8.unpack $ r ^. responseBody

getImage :: Response ByteString -> t -> ([Char], [Char], [Char], [Char], t)
getImage r l = fromJust $ scalpImage (Char8.unpack $ r ^. responseBody) l

scalpTitles :: String -> Maybe [[(String, String)]]
scalpTitles s = scrapeStringLike s gt
  where
    gt = chroots ("div"//"ul" @: [hasClass "series_alpha"])$ do 
      ti <- texts $ "a"
      li <- attrs "href" "a"
      return $ Prelude.zip ti li

scalpChapters :: String -> Maybe [[(String, String)]]
scalpChapters s = scrapeStringLike s gt
  where
    gt = chroots ("div" @: [AnyAttribute @= "chapterlist"])$ do 
      ti <- texts $ "a"
      li <- attrs "href" "a"
      return $ Prelude.zip ti li 

scalpImage :: String -> t -> Maybe (String, String, String, String, t)
scalpImage ss l = scrapeStringLike ss gt
  where
    gt = chroot ("div") $ do 
      w <- attr "width"  "img"
      h <- attr "height" "img"
      s <- attr "src"    "img"
      a <- attr "alt"    "img"
      return (w, h, s, a, l)









