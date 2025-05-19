import System.Environment

main :: IO()
main = do
    ( file:n:_ ) <- getArgs
    contents <- readFile file
    putStr $ unlines $ take ( read n ) ( lines contents )