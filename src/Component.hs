{-# LANGUAGE OverloadedStrings #-}

module Component where

import ProfScrapeLib (constructURL)
import Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes as A

schoolCard :: (String, String, Maybe Int) -> Html
schoolCard (abbrev, name, count) =
  H.div ! A.class_ "flex border-2 rounded-lg border-gray-200 p-8 flex-col my-2" $ do
    H.h1 ! A.class_ "text-xl font-extrabold" $ toHtml name
    schoolCardItem "Url" . constructURL $ abbrev
    schoolCardItem "Number of Professors" $ maybe "No Result" show count

schoolCardItem :: String -> String -> Html
schoolCardItem attribute value =
  H.div ! A.class_ "flex flex-row" $ do
    H.p . toHtml $ (attribute ++ ": ")
    H.p ! A.class_ "font-bold ml-2" $ toHtml value
