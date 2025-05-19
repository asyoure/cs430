module Utils where
import Data.List
import Data.Ord
import System.IO
import System.Environment

parseInts :: [String] -> [Int]
parseInts = map read

orderLength :: String -> String -> Ordering
orderLength = comparing length

grepFile :: String -> FilePath -> IO ()
grepFile search filePath = do
    content <- readFile filePath
    mapM_ putStrLn $ filter (isInfixOf search) (lines content)