try {
  ...
} catch {
  case nfe:NumberFormatException => { println(nfe); List(0) }
  case _ => Nil
}

