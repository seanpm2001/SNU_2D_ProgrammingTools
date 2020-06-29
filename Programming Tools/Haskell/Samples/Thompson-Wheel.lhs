{-# LANGUAGE FlexibleInstances #-}

import Control.Monad (forM)

----------------------------------------------
-- VARIATIONS

-- YOU: feel free to play with the variations
sizes      = [ (16,16), (32,32), (64,64), (128,128), (256, 256) ]
variations = [ ( "normal-partround-lambda-col1", sizes, col1 opt0 ),
               ( "normal-partround-lambda-col2", sizes, col2 opt0 ),
               ( "normal-partround-lambda",      sizes, opt0 ),
               ( "bold-round-lambda",            sizes, opt3 ),
               ( "bold-lambda-on-top",           sizes, opt5 ),
               ( "bold-bind-on-top",             sizes, opt1 ),
               ( "skinny-lambda-on-top",         sizes, opt2 ),
               ( "skinny-round-lambda",          sizes, opt4 ),
               ( "outline-bold",                 sizes, outline opt5 ),
               ( "outline-normal-partrounded",   sizes, partRounded $ outline opt0 ),
               ( "outline-skinny-partrounded",   sizes, partRounded $ outline opt2 ) ]

main = do
   let flatVars = flattened variations
   forM flatVars $ \ (fname, size, opt, _) -> do
      let svgStr = svgShapes size opt
      writeFile fname svgStr
   let htmlChunk triple@(desc,_,_) =
        let embed (fname, (sizex,sizey), _, _) =
               "<td><embed src=\""++fname++"\" width='"++show (round sizex)++
                  "' height='"++show (round sizey)++"' /></td>\n"
            insides = concatMap embed (flattened [triple])
          in "<tr>\n<td>"++desc++"</td>\n"++insides++"</tr>\n"
   let svgHTML = "<html><title>Haskell Logo variations</title><body>\n"++
                   "<table>\n" ++ concatMap htmlChunk variations ++ "\n</table>\n</body>\n</html>"
   let htmlOut = "svg-test.html"
   writeFile htmlOut svgHTML
   putStrLn$ "Wrote out files. Point your browser at "++htmlOut

flattened vars =
  [ (desc ++ "-" ++ show (round sizex) ++ ".svg", size, opt, desc) |
     (desc, size@(sizex, _), opt) <- flatten vars ]
flatten vars = do
   (desc, sizes, opt) <- vars
   size <- sizes
   return (desc, size, opt)

opt0 = partRounded optNormal
opt1 = optBold { lambda = leg }
opt2 = optSkinny
opt3 = rounded optBold
opt4 = rounded opt2
opt5 = optBold

data Options a = Opt
     { hh, bb, kk, kk2, tt, tt2, ee, kk3 :: a,
       roundness, looseness :: a,
       monochrome, lambda, overlap, nofill, roundCorners, allRound :: Bool,
       color1, color2 :: RGB a }
optSkinny = optBold { kk = 0.8, kk2 = 0.8*sqrt2*0.7, kk3 = 0.8/sqrt2,
                      tt = 1.5/2, tt2 = 1.5/2/sqrt2, roundness = 0.2 }
optNormal = optBold { kk = 0.8, kk2 = 0.8*sqrt2*0.7, kk3 = 0.8/sqrt2,
                      tt = 2.5/2, tt2 = 2.5/2/sqrt2, roundness = 0.2 }

outline opt = opt { nofill = True, monochrome = True, lambda = True }
rounded opt = opt { roundCorners = True }
partRounded opt = opt { roundCorners = True, allRound = False }

black = RGB 0.0 0.0 0.0
gray = RGB 0.1 0.1 0.1
gray1 = RGB (75/255) (84/255) (87/255)
gray2 = RGB (113/255) (127/255) (129/255)
khaki1 = RGB (175/255) (167/255) (159/255)
khaki2 = RGB (215/255) (210/255) (203/255)
teal = RGB (60/255) (130/255) (132/255)
royal = RGB (73/255) (21/255) (123/255)
dteal = RGB (70/255) (120/255) (122/255)
droyal = RGB (63/255) (41/255) (113/255)
col1 opt = opt { color1 = droyal, color2 = dteal }
col2 opt = opt { color1 = khaki1, color2 = khaki2 }

leg = False
optBold = Opt {
   -- COLOR/STYLE ISSUES
   -- could force colors to be the same as color1
   monochrome = False,
   -- could do only outlines, no fill (best with monochrome==True)
   nofill = False,
   -- draw the leg under the right '>' sign (==True, recommended) or just touch shapes
   overlap = True,
   -- rounded corners?
   roundness    = 0.3,  -- 0 = start curving at midpoint, 1 = no curve at all
   looseness    = 0.7,  -- 0 = curve control points sit atop one another, 1 = floppy, loose curves (higher radius)
   roundCorners = False,
   allRound     = True,
   -- style: lambda on top (colorwise, lambda solid color) or '>>' on top (leg its own color)
   lambda = True,
   -- basic colors
   color1 = gray1,
   color2 = gray2,

   -- DESIGN/SHAPE
   hh = 6.0,                                   -- height
   bb = 2.0,                                   -- horizontal distance between left end of '>' and right point of '>'
   kk = 0.5, kk2 = 0.5*sqrt2, kk3 = 0.5/sqrt2, -- padding values
   tt = 1.5, tt2 = 1.5/sqrt2,                  -- thickness of various parts (horizontal and diagonal, respectively)
   ee = 2.5                                    -- length of equals sign
   }

----------------------------------------------
-- Mini EDSL for creating SVGs

instance Num a => Num (a,a) where
   (x0,y0) + (x1,y1) = (x0+x1, y0+y1)
   (x0,y0) - (x1,y1) = (x0-x1, y0-y1)
   (x0,y0) * (s,_) = (s*x0, s*y0) -- note that this is a hack!
   fromInteger i = (fromInteger i,0) -- this hack goes with the above hack
   negate (x,y) = (negate x, negate y)
   abs (x,y) = error "abs of tuple undefined"
   signum (x,y) = error "signum of tuple undefined"

instance (Num a, Fractional a) => Fractional (a,a) where
   recip (x0,y0) = error "recip of tuple undefiened"
   (x0,y0) / (x1,_) = (x0/x1, y0/x1)
   fromRational r = (fromRational r,0)

type Pt a = (a,a)
data Command a =
   Move (Pt a)
   | LineTo (Pt a)
   | Control { c1, c2, nextPt :: (Pt a) }
   | Cycle
     deriving (Show, Eq)

-- type Path a = [Command a] -- too general! 'a' must be Show-able!!!!!!
type Path = [Either (Command Double) (Command Double)]

m p = Move p
z = Cycle
l p = LineTo p
c p1 p2 pNext = Control p1 p2 pNext

data RGB a = RGB { red, green, blue :: a } deriving (Eq, Show)

----------------------------------------------
-- CUSTOM HASKELL LOGO

sqrt2 = 1.4142

unEither (Left  x) = x
unEither (Right x) = x

-- like LineTo (or 'l') but here we draw the line and a control curve around the end point
roundLineTo (roundness,looseness) prevW meW nextW =
   let me       = unEither meW
       prev     = unEither prevW
       next     = unEither nextW
       sharp    = case meW of { Left _ -> True; Right _ -> False }
       percMe   = 1/2 + (1-roundness)/2
       nearMe   = me `times` percMe + prev `times` (1-percMe)
       nearMe'  = me `times` percMe + next `times` (1-percMe)
       ctrlPerc = 1/2 + (1-looseness)/2
       me1      = nearMe `times` (1-ctrlPerc) + me `times` ctrlPerc
       me2      = nearMe' `times` (1-ctrlPerc) + me `times` ctrlPerc
    in if sharp
         then [l me, l nearMe']
         else [l nearMe, c me1 me2 nearMe']

makeRound' parms first (sndlast:lst:[]) =
   roundLineTo parms sndlast lst first
makeRound' parms first (prev:(rest@(me:next:_))) =
   roundLineTo parms prev me next ++ makeRound' parms first rest
makeRound' parms first _ = error "Expected at least three points for makeRound'"

pt `times` s = (s * fst pt, s * snd pt)

makeRoundBase parms@(roundness,looseness) (rest@(firstW:secondW:_)) =
   let percMe        = 1/2 + (1-roundness)/2
       lstW          = last rest
       lst           = unEither lstW
       first         = unEither firstW
       -- second        = unEither secondW
       startNearLast = lst `times` percMe + first `times` (1-percMe)
       firstLineTo   = roundLineTo parms lstW firstW secondW
     in [m startNearLast] ++ firstLineTo ++ makeRound' parms firstW rest --    ++ [z]  -- not needed since we manually reconnect

-- pass on the sharpPt (Left) / roundPt (Right) information
getPoints []                      = []
getPoints (Left Cycle:[])         = []
getPoints (Right Cycle:[])        = []
getPoints ((Left  (LineTo pt)):l) = Left pt  : getPoints l
getPoints ((Right (LineTo pt)):l) = Right pt : getPoints l
getPoints ((Left  (Move pt)):l)   = Left pt  : getPoints l
getPoints ((Right (Move pt)):l)   = Right pt : getPoints l
getPoints _ = error "Badly formed input: makeRound expects a shape ending with a Z (Cycle), containing no Control points, just Move and LineTo"

-- make all points rounded! (Right)
getPointsR []                      = []
getPointsR (Left Cycle:[])         = []
getPointsR (Right Cycle:[])        = []
getPointsR ((Left  (LineTo pt)):l) = Right pt  : getPointsR l
getPointsR ((Right (LineTo pt)):l) = Right pt : getPointsR l
getPointsR ((Left  (Move pt)):l)   = Right pt  : getPointsR l
getPointsR ((Right (Move pt)):l)   = Right pt : getPointsR l
getPointsR _ = error "Badly formed input: makeRound expects a shape ending with a Z (Cycle), containing no Control points, just Move and LineTo"

makeRound getpts parms list = makeRoundBase parms (getpts list)

-- the heart of the Logo
shapes opt = let
   -- colors
   col1 = color1 opt
   col2 = if monochrome opt then col1 else color2 opt
   round = roundCorners opt
   getPoints' = if allRound opt then getPointsR else getPoints
   rounder = if round then makeRound getPoints' parms else map unEither
   -- NOTE: wrapping Either for prounding (Partial Rounding): Left=point is 'left' alone, Right=round that point
   roundPt = Right
   sharpPt = Left -- point 'left' sharp
   parms = (roundness opt, looseness opt)

   -- constants
   h = hh opt; b = bb opt; e = ee opt
   k = kk opt; k2 = kk2 opt; k3 = kk3 opt
   t = tt opt; t2 = tt2 opt
   s = k3 + t2

   rstroke = (t/2,0)
   lstroke = (-t/2,0)
   
   -- skeleton 0 : left '>' symbol
   skel0 = [(0,0), (b,h/2), (0,h)]

   leftGT = leftGT' skel0
   leftGT' s0 = rounder [roundPt$ m$ s0!!0 + rstroke, sharpPt$ l$ s0!!1 + rstroke, roundPt$ l$ s0!!2 + rstroke,
                         roundPt$ l$ s0!!2 + lstroke, sharpPt$ l$ s0!!1 + lstroke, roundPt$ l$ s0!!0 + lstroke, roundPt z]

   -- skeleton 1 : right '>' symbol
   skel1 = [(b+t+k-b,0), (b+t+k,h/2), (b+t+k-b,h)]
   rightGT = leftGT' skel1

   -- skeleton 2 : lambda and/or leg
   skel2 = [ skel1!!1, (fst(skel1!!0) + 2*b, snd(skel1!!0)) ]
   why x = let
      bl = skel2!!1 + lstroke
      tl = skel1!!2 + lstroke
      dx = fst tl - fst bl
      dy = h
      y  = dy * (x - fst bl) / dx + snd bl
      in   y
   crosspt = let x = fst(skel2!!0) in (x, why x)

   lam = rounder [roundPt$ m$ skel1!!0 + rstroke, sharpPt$ l$ crosspt,
          roundPt$ l$ skel2!!1 + lstroke, roundPt$ l$ skel2!!1 + rstroke,
          roundPt$ l$ skel1!!2 + rstroke, roundPt$ l$ skel1!!2 + lstroke,
          sharpPt$ l$ skel1!!1 + lstroke, roundPt$ l$ skel1!!0 + lstroke, roundPt z]
   leg' = [roundPt$ m$ skel2!!0 + rstroke, sharpPt$ l$ skel2!!1 + rstroke,
           sharpPt$ l$ skel2!!1 + lstroke]
   leg = if overlap opt
           then rounder $ leg' ++ [roundPt$ l$ skel2!!0 + lstroke, roundPt z]
           else rounder $ leg' ++ [sharpPt$ l$ crosspt, roundPt z]

   -- calculate the slanted part of the equals sign
   eqCtrLft = skel1!!1 + (t2/2+k2,0)
   eqCtrRgt = eqCtrLft + (e,0)

   farRight = fst eqCtrRgt

   eks y = fst eqCtrLft + 2*b*(h/2 - y)/h
   xy y = (eks y, y)

   -- skel3 = [ xy (h/2+s/2), eqCtrRgt + (0,s/2) ] -- skeleton or guide to bisect equals sign
   -- the two pieces of the equals sign
   eqTop = rounder [ sharpPt$ m$ xy (h/2+s/2-t2/2), roundPt$ l$ (farRight,h/2+s/2-t2/2),
            roundPt$ l$ (farRight,h/2+s/2+t2/2), sharpPt$ l$ xy (h/2+s/2+t2/2), roundPt z]
   eqBot = rounder [ sharpPt$ m$ xy (h/2-s/2-t2/2), roundPt$ l$ (farRight,h/2-s/2-t2/2),
             roundPt$ l$ (farRight,h/2-s/2+t2/2), sharpPt$ l$ xy (h/2-s/2+t2/2), roundPt z]

   boundsBL = (-1.5*t,-t)
   boundsBR = (farRight+t,-t)
   boundsTR = (farRight+t,h+t)
   boundsTL = (-1.5*t,h+t)

   bounds = (boundsBL,boundsTR)

   in if lambda opt
        then (bounds, [(col1, leftGT), (col2, lam), (col1, eqTop), (col1, eqBot)])
        else (bounds, [(col1, leftGT), (col2, leg), (col1, rightGT), (col1, eqTop), (col1, eqBot)])

----------------------------------------------
-- SVG string concatenation code

svgXMLheaders = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n" ++
     "<!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.0//EN\" \"http://www.w3.org/TR/2001/REC-SVG-20010904/DTD/svg10.dtd\">" ++ "\n"

hexChars = "0123456789abcdef"
byteToHex b | b <= 0    = "00"
            | b >= 255  = "ff"
            | otherwise = big:small:[]
                  where big = hexChars !! hi
                        small = hexChars !! lo
                        hi = b `div` 16
                        lo = b `mod` 16

svgColorToStyle outline col thick =
   if outline
     then "fill=\"none\" stroke=\""++c++"\" stroke-width=\""++show thick++"\""
     else "fill=\""++c++"\" stroke=\""++c++"\" stroke-width=\""++show thick++"\""
     where c = "#" ++ r ++ g ++ b
           r = byteToHex $ round (255 * red col)
           g = byteToHex $ round (255 * green col)
           b = byteToHex $ round (255 * blue col)

-- see http://www.w3.org/TR/SVG11/paths.html#PathDataGeneralInformation
cmdToStr (Move p)          = "M "++showPt p
cmdToStr (LineTo p)        = "L "++showPt p
cmdToStr (Control c1 c2 p) = "C "++showPt c1++" "++showPt c2++" "++showPt p
cmdToStr Cycle             = "z"
showPt (x,y) = show x++" "++show y

pathToStr path = unwords [cmdToStr c | c <- path]

pathToSVG outline strokeWid (col,path) =
   "<path d=\""++d++"\" "++style++" />"
   where style = svgColorToStyle outline col strokeWid
         d     = pathToStr path

flipCmd f (Move p) = Move (f p)
flipCmd f (LineTo p) = LineTo (f p)
flipCmd f (Control p q r) = Control (f p) (f q) (f r)
flipCmd f Cycle = Cycle
flipPath f path = [flipCmd f c | c <- path]
flipPaths f paths = [(col,flipPath f p) | (col,p) <- paths]

svg (w,h) box title desc paths =
--   "<svg width=\""++w++"\" height=\""++h++"\" viewBox=\""++box++"\" xmlns=\"http://www.w3.org/2000/svg\" version=\"1.0\">\
 "<svg width=\""++w++"\" height=\""++h++"\" xmlns=\"http://www.w3.org/2000/svg\" version=\"1.0\">\
   \\n  <title>"++title++"</title>\
   \\n  <desc>"++desc++"</desc>"++ "\n"
   ++ paths ++ "\n" ++
   "</svg>" ++"\n"

pathsToSVG strokeWid wh box outline paths =
   svgXMLheaders ++ svg wh box title desc bigstr
   where bigstr = unlines [pathToSVG outline strokeWid p | p <- paths]
         title  = "Haskell Logo"
         desc   = "Combination bind and lambda symbol"

svgShapes (w,h) opt = let
   (bounds@((blx,bly),(trx,try)),paths') = shapes opt
   xscale = trx - blx
   yscale = try - bly
   slide (x,y) = (x - blx, y - bly)
   flipy (x,y) = (x, yscale - y)
   scale (x,y) = (w * x / xscale, w * y / xscale)
   trans = scale . flipy . slide

   newbnds@((a,b),(c,d)) = (trans (blx,bly), trans (trx,try))
   box = show a++" "++show b++" "++show c++" "++show d

   paths  = flipPaths trans paths'
   wh     = (show $ round w, show $ round h)  --("8cm", "8cm")
   
   outline = nofill opt

   strokeWid = w/128

   in   pathsToSVG strokeWid wh box outline paths