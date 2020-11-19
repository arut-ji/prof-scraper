{-# LANGUAGE OverloadedStrings #-}

module Report
  ( report,
  )
where

import Component as C
import Control.Monad (forM_)
import Text.Blaze.Html.Renderer.String (renderHtml)
import Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes as A

report :: [(String, String, Maybe Int)] -> String
report = renderHtml . page

page :: [(String, String, Maybe Int)] -> Html
page xs = docTypeHtml $ do
  H.head $ do
    H.title "Number of Professors from each school"
    tailwindCDN
  body $ do
    container $ do
      H.div $ do
        H.h1 ! A.class_ "font-black text-3xl" $ "Number of Professors from each school"
        H.div $ forM_ xs C.schoolCard

tailwindCDN :: Html
tailwindCDN = link ! cdn ! relType
  where
    cdn = A.href "https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css"
    relType = A.rel "stylesheet"

container :: Html -> Html
container = H.div ! A.class_ "flex flex-col min-h-screen min-w-screen items-center justify-center"