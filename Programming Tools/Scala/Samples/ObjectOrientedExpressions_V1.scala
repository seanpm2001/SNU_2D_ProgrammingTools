abstract class Window {
  // abstract
  def draw()
}

class SimpleWindow extends Window {
  def draw() {
    println("in SimpleWindow")
    // draw a basic window
  }
}

trait WindowDecoration extends Window { }

trait HorizontalScrollbarDecoration extends WindowDecoration {
  // "abstract override" is needed here in order for "super()" to work because the parent
  // function is abstract. If it were concrete, regular "override" would be enough.
  abstract override def draw() {
    println("in HorizontalScrollbarDecoration")
    super.draw()
    // now draw a horizontal scrollbar
  }
}

trait VerticalScrollbarDecoration extends WindowDecoration {
  abstract override def draw() {
    println("in VerticalScrollbarDecoration")
    super.draw()
    // now draw a vertical scrollbar
  }
}

trait TitleDecoration extends WindowDecoration {
  abstract override def draw() {
    println("in TitleDecoration")
    super.draw()
    // now draw the title bar
  }
}
