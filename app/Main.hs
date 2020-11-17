module Main where

import ProfScrapeLib
import Text.HTML.Scalpel

schools :: [String]
schools =
  [ "chemistry",
    "computing",
    "engineering",
    "ges",
    "mathematicsstatistics",
    "physics",
    "psychology"
  ]

main :: IO ()
main = do
  counts <- mapM numProfessors schools
  let results = zip schools counts
  mapM_ (\x -> putStrLn $ fst x ++ ": " ++ (show . snd $ x)) results