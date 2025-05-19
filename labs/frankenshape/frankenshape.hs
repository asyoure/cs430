import Text.Printf

data Color = Color Int Int Int
data Shape = Circle (Int, Int) Int Color | Rectangle (Int, Int) (Int, Int) Color
data Frankenshape = Frankenshape [Shape]

class Svgable a where
    toSvg :: a -> String

instance Svgable Color where
    toSvg (Color r g b) = printf "rgb(%d, %d, %d)" r g b

instance Svgable Shape where
    toSvg (Circle (cx, cy) r color) = printf "<circle cx=\"%d\" cy=\"%d\" r=\"%d\" fill=\"%s\" />" cx cy r (toSvg color)
    toSvg (Rectangle (x, y) (w, h) color) = printf "<rect x=\"%d\" y=\"%d\" width=\"%d\" height=\"%d\" fill=\"%s\" />" x y w h (toSvg color)

instance Svgable Frankenshape where
    toSvg (Frankenshape shapes) = concat["<svg xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\">\n", unlines (map toSvg shapes), "</svg>"]

main :: IO ()
main = do
    -- trying to make a Super Saiyan kamehameha wave
    let kamehameha = Circle (250, 100) 50 (Color 0 127 255) -- Azure color
        beamStruggle = Rectangle (75, 75) (200, 50) (Color 0 127 255)
        head = Circle (30, 60) 20 (Color 210 180 140)
        iris = Circle (45, 63) 4 (Color 255 255 255)
        pupil = Circle (46, 63) 2 (Color 80 200 120)
        bangL = Rectangle (13, 30) (10, 25) (Color 255 221 0)
        outbangL = Rectangle (8, 37) (10, 20) (Color 255 221 0)
        bang = Rectangle (20, 22) (20, 30) (Color 255 221 0)
        bangR = Rectangle (36, 30) (10, 25) (Color 255 221 0)
        outbangR = Rectangle (42, 37) (10, 20) (Color 255 221 0)
        logo = Circle (35, 93) 4 (Color 255 255 255)
        turtle = Rectangle (34, 92) (3, 3) (Color 0 0 0)
        body = Rectangle (15, 80) (30, 60) (Color 255 128 0)
        shoe = Rectangle (25, 140) (10, 10) (Color 0 0 255)
        armband = Rectangle (59, 95) (10, 10) (Color 0 0 255) 
        arm = Rectangle (45, 95) (30, 10) (Color 210 180 140)
        frankenshape = Frankenshape [beamStruggle, kamehameha, body, arm, armband, shoe, head, bang, bangL, bangR, outbangL, outbangR, iris, pupil]
    writeFile "frankenshape.svg" (toSvg frankenshape)