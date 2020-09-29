import "math"

type Shape interface {
    Area() float64
}

type Square struct { // Note: no "implements" declaration
    side float64
}

func (sq Square) Area() float64 { return sq.side * sq.side }

type Circle struct { // No "implements" declaration here either
    radius float64
}

func (c Circle) Area() float64 { return math.Pi * math.Pow(c.radius, 2) }

