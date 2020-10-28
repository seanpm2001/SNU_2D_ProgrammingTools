val urls = List("https://scala-lang.org", "https://github.com/scala/scala")

def fromURL(url: String) = scala.io.Source.fromURL(url)
  .getLines().mkString("\n")

val t = System.currentTimeMillis()
urls.par.map(fromURL(_)) // par returns parallel implementation of a collection
println("time: " + (System.currentTimeMillis - t) + "ms")
