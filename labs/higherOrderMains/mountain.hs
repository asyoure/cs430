import Utils
import System.Environment
import Data.List

main :: IO()
main = do
    args <- getArgs
    case args of
        [filepath] -> do
            content <- readFile filepath
            let sortedLines = sortBy orderLength (lines content)
            mapM_ putStrLn sortedLines