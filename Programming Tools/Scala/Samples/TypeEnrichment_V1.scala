object MyExtensions {
  implicit class IntPredicates(i: Int) {
    def isEven = i % 2 == 0
    def isOdd  = !isEven
  }
}

import MyExtensions._  // bring implicit enrichment into scope
4.isEven  // -> true

