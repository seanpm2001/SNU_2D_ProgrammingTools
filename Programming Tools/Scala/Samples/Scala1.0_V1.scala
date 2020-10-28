// Scala: Direct conversion from Java

// no import needed; scala.math
// already imported as `math`
def mathFunction(num: Int): Int = {
  var numSquare: Int = num*num
  return (math.cbrt(numSquare) + math.log(numSquare)).
    asInstanceOf[Int]
}
