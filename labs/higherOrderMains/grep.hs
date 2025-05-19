import Utils
import System.Environment
import Data.List

main :: IO()
main = do
    args <- getArgs
    case args of
        (search : files) -> mapM_ (grepFile search) files