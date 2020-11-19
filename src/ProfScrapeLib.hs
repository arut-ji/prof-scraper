{-# LANGUAGE OverloadedStrings #-}

module ProfScrapeLib
  ( numProfessors,
    constructURL,
  )
where

import Data.List
import Text.HTML.Scalpel

numProfessors :: String -> IO (Maybe Int)
numProfessors x = do
  res <- scrapeURL (constructURL x) scrapeStaffSection
  return $ maybeTransform $ length . filterProfessors . concat <$> res

maybeTransform :: Maybe Int -> Maybe Int
maybeTransform (Just x) = if x == 0 then Nothing else Just x

constructURL :: String -> String
constructURL x = "https://www.gla.ac.uk/schools/" ++ x ++ "/staff"

scrapeStaffSection :: Scraper String [[String]]
scrapeStaffSection = chroot ("div" @: ["id" @= "content_1234567"]) nonHonoraryStaffs

nonHonoraryStaffs :: Scraper String [[String]]
nonHonoraryStaffs = chroots ("ul" @: [nonHonoraryVisiting]) $ texts "li"
  where
    nonHonoraryVisiting = notP ("id" @= "honorary-visitinglist")

filterProfessors :: [String] -> [String]
filterProfessors = filter pred
  where
    pred x = isProf x && isNotAssistantProf x && isNotAssociateProf x
    isProf = isInfixOf "Professor"
    isNotAssistantProf = not . isInfixOf "Assistant Professor"
    isNotAssociateProf = not . isInfixOf "Associate Professor"