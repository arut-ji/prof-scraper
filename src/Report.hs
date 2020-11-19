{-# LANGUAGE OverloadedStrings #-}

module Report
  ( generateReport,
  )
where

import Control.Monad (forM_)
import Text.Blaze.Html.Renderer.String (renderHtml)
import Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes as A

generateReport :: [(String, String, Maybe Int)] -> IO ()
generateReport = writeFile "index.html" . renderHtml . page

page :: [(String, String, Maybe Int)] -> Html
page xs = docTypeHtml $ do
  H.head $ do
    H.title "Number of professors from each school"
    tailwindCDN
  body $ do
    container $ do
      H.div $ do
        H.h1 ! A.class_ "font-black text-3xl" $ "Number of professors from each school"
        H.div $ forM_ xs (professorChart . getMaximumCount $ xs)

getMaximumCount :: [(String, String, Maybe Int)] -> Int
getMaximumCount = foldl (\acc (_, _, Just x) -> maximum [acc, x]) 0

tailwindCDN :: Html
tailwindCDN = link ! cdn ! relType
  where
    cdn = A.href "https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css"
    relType = A.rel "stylesheet"

container :: Html -> Html
container = H.div ! A.class_ "flex flex-col min-h-screen min-w-screen items-center justify-center"

professorChart :: Int -> (String, String, Maybe Int) -> Html
professorChart maxCount (_, name, Just count) =
  H.div $ do
    H.h1 ! A.class_ "text-xl font-bold" $ toHtml name
    H.div ! A.class_ "flex flex-row items-center bg-gray-500 rounded-r-lg h-10 my-2 pl-4" ! A.style (H.toValue . convertToCSSStyle $ barWidth count maxCount) $ do
      H.p ! A.class_ "font-medium text-gray-100" $ toHtml . (++ " Professors") . show $ count
  where
    barWidth count maxCount = (++ "%") . take 5 . show . (* 100) $ (fromIntegral count / fromIntegral maxCount)
    convertToCSSStyle p = "width: " ++ p ++ ";"