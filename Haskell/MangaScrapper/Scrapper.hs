{-# LANGUAGE OverloadedStrings #-}

module Scrapper where 

import Text.HTML.Scalpel.Core
import Control.Applicative
import Network.Wreq
import Data.Aeson.Lens (_String, key)
import Control.Lens
import Data.ByteString.Lazy.Char8 as Char8
import Data.Maybe

getTitles r = Prelude.concat $ fromJust $ scalpTitles $ Char8.unpack $ r ^. responseBody
getChapters r = Prelude.concat $ fromJust $ scalpChapters $ Char8.unpack $ r ^. responseBody
getImage r = fromJust $ scalpImage $ Char8.unpack $ r ^. responseBody


scalpTitles s = scrapeStringLike s gt
  where
    gt = chroots ("div"//"ul" @: [hasClass "series_alpha"])$ do 
      ti <- texts $ "a"
      li <- attrs "href" "a"
      return $ Prelude.zip ti li

scalpChapters s = scrapeStringLike s gt
  where
    gt = chroots ("div" @: [AnyAttribute @= "chapterlist"])$ do 
      ti <- texts $ "a"
      li <- attrs "href" "a"
      return $ Prelude.zip ti li 

scalpImage ss = scrapeStringLike ss gt
  where
    gt = chroot ("div") $ do 
      w <- attr "width"  "img"
      h <- attr "height" "img"
      s <- attr "src"    "img"
      a <- attr "alt"    "img"
      return (w, h, s, a)









