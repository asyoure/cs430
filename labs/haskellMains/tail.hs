import System.Environment
import System.IO

main :: IO ()
main = do
  (file:n:_) <- getArgs
  contents <- readFile file
  putStr $ unlines $ drop ((length $ lines contents) - read n) (lines contents)