import Utils
import System.Environment

main :: IO()
main = do
    [filepath] <- getArgs
    nums <- parseInts . lines <$> readFile filepath
    mapM_ print [x | x <- nums, (100 - x) `elem` nums]