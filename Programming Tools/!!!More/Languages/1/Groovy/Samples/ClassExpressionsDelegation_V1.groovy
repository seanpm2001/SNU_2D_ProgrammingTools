/* 
 * This class will handle the operations that can be used in the closure above. Another class
 * could be declared having the same methods, but using, for example, webservice operations
 * in the calculations.
 */
class Expression {
  BigDecimal value

  /* 
   * Though an Integer is passed as a parameter, it is coerced into a BigDecimal, as was 
   * defined. If the class had a 'declare(Integer value)' method, it would be used instead.
   */
  def declare(BigDecimal value) {
    this.value = value
  }
  
  def sum(BigDecimal valueToAdd) {
    this.value += valueToAdd
  }
  
  def divide(BigDecimal divisor) {
    this.value /= divisor
  }
  
  def propertyMissing(String property) {
    if (property == "print") println value
  }
}

