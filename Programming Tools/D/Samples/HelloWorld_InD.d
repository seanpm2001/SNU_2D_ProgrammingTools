import std.stdio;
void main() {
    int multiplier = 10;
    int scaled(int x) { return x * multiplier; }

    foreach (auto i; 0 .. 10) {
        writefln("Hello, world %d! scaled = %d", i, scaled(i));
    }
}
// From: https://en.wikipedia.org/wiki/Dlang
// File version: 1 (October 25th 2019)
// Latest version: 1 (October 25th 2019)