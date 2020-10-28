// Java:
public class Point {
  private final double x, y;

  public Point(final double x, final double y) {
    this.x = x;
    this.y = y;
  }

  public Point(
    final double x, final double y,
    final boolean addToGrid
  ) {
    this(x, y);

    if (addToGrid)
      grid.add(this);
  }

  public Point() {
    this(0.0, 0.0);
  }

  public double getX() {
    return x;
  }

  public double getY() {
    return y;
  }

  double distanceToPoint(final Point other) {
    return distanceBetweenPoints(x, y,
      other.x, other.y);
  }

  private static Grid grid = new Grid();

  static double distanceBetweenPoints(
      final double x1, final double y1,
      final double x2, final double y2
  ) {
    return Math.hypot(x1 - x2, y1 - y2);
  }
}
