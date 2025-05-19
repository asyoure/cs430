import System.Environment

printSeq :: Int -> Int -> Int -> IO ()
printSeq current target delta
  | current == target = print current
  | otherwise = do
      print current
      printSeq (current + delta) target delta

main :: IO ()
main = do
  args <- getArgs
  case map read args of
    [start, end] -> let delta = if start <= end then 1 else -1
                    in printSeq start end delta