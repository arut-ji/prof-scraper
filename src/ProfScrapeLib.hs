{-# LANGUAGE OverloadedStrings #-}

module ProfScrapeLib
  ( numProfessors,
  )
where

import Data.List
import Text.HTML.Scalpel

numProfessors :: String -> IO (Maybe Int)
numProfessors x = do
  res <- scrapeURL (constructURL x) staffs
  return $ length . filterProfessors . concat <$> res

constructURL :: String -> String
constructURL x = "https://www.gla.ac.uk/schools/" ++ x ++ "/staff"

staffs :: Scraper String [[String]]
staffs = chroots ("ul" @: [nonHonoraryVisiting]) $ texts "li"
  where
    nonHonoraryVisiting = notP ("id" @= "honorary-visitinglist")

filterProfessors :: [String] -> [String]
filterProfessors = filter pred
  where
    pred x = isProf x && isNotAssistantProf x && isNotAssociateProf x
    isProf = isInfixOf "Professor"
    isNotAssistantProf = not . isInfixOf "Assistant Professor"
    isNotAssociateProf = not . isInfixOf "Associate Professor"