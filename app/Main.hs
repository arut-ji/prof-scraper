module Main where

import ProfScrapeLib (numProfessors)
import Report
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

schoolNames :: [String]
schoolNames =
  [ "School of Chemistry",
    "School of Computing Science",
    "James Watt School of Engineering",
    "School of Geographical & Earth Sciences",
    "School of Mathematics & Statistics",
    "School of Physics & Astronomy",
    "School of Psychology"
  ]

main :: IO ()
main = do
  counts <- mapM numProfessors schools
  let results = zip3 schools schoolNames counts
  generateReport results