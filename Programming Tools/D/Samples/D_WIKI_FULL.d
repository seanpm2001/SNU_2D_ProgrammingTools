// Examples from: https://en.wikipedia.org/wiki/Dlang
import std.stdio;
void main() {
    int multiplier = 10;
    int scaled(int x) { return x * multiplier; }

    foreach (auto i; 0 .. 10) {
        writefln("Hello, world %d! scaled = %d", i, scaled(i));
    }
}
ulong factorial(ulong n)
{
    if (n<2)
        return 1;
    else
        return n * factorial(n-1);
}
template Factorial(ulong n)
{
    static if (n<2)
        enum Factorial = 1;
    else
        enum Factorial = n * Factorial!(n-1);
}
enum fact_7 = Factorial!(7);
enum fact_9 = factorial(9);
import std.string : format;
pragma(msg, format("7! = %s", fact_7));
pragma(msg, format("9! = %s", fact_9));
import FooToD; // hypothetical module which contains a function that parses Foo source code
               // and returns equivalent D code
void main()
{
    mixin(fooToD(import("example.foo")));
}
int function(int) g;
g = (x) { return x * x; }; // longhand
g = (x) => x * x;          // shorthand
import std.stdio, std.algorithm, std.range;

void main()
{
    int[] a1 = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
    int[] a2 = [6, 7, 8, 9];

    // must be immutable to allow access from inside a pure function
    immutable pivot = 5;

    int mySum(int a, int b) pure nothrow // pure function
    {
        if (b <= pivot) // ref to enclosing-scope
            return a + b;
        else
            return a;
    }

    // passing a delegate (closure)
    auto result = reduce!mySum(chain(a1, a2));
    writeln("Result: ", result); // Result: 15

    // passing a delegate literal
    result = reduce!((a, b) => (b <= pivot) ? a + b : a)(chain(a1, a2));
    writeln("Result: ", result); // Result: 15
}
    auto result = a1.chain(a2).reduce!mySum();
    writeln("Result: ", result);

    result = a1.chain(a2).reduce!((a, b) => (b <= pivot) ? a + b : a)();
    writeln("Result: ", result);
import std.stdio : writeln;
import std.range : iota;
import std.parallelism : parallel;

void main()
{
    foreach (i; iota(11).parallel) {
        // The body of the foreach loop is executed in parallel for each i
        writeln("processing ", i);
    }
}
import std.stdio, std.concurrency, std.variant;

void foo()
{
    bool cont = true;

    while (cont)
    {
        receive( // delegates are used to match the message type
            (int msg) => writeln("int received: ", msg),
            (Tid sender) { cont = false; sender.send(-1); },
            (Variant v) => writeln("huh?") // Variant matches any type
        );
    }
}

void main()
{
    auto tid = spawn(&foo); // spawn a new thread running foo()

    foreach (i; 0 .. 10)
        tid.send(i);   // send some integers
    tid.send(1.0f);    // send a float
    tid.send("hello"); // send a string
    tid.send(thisTid); // send a struct (Tid)

    receive((int x) => writeln("Main thread received message: ", x));
}
@safe void test()
{
    int tmp = 0; //#1
    int* rad; //#2
    rad = &tmp; //If the order of the declarations of #1 and #2 is reversed, this fails
    {
    	int bad = 45; //Lifetime of "bad" only extends to the scope in which it is defined
        *rad = bad; //This is kosher
        rad = &bad; //Lifetime of rad longer than bad, hence this is not kosher at all.       
    }
}
@safe:

int* gp;
void thorin(scope int*);
void gloin(int*);
int* balin(return scope int* p, scope int* q, int* r)
{
     gp = p; // error, p escapes to global gp
     gp = q; // error, q escapes to global gp
     gp = r; // ok

     thorin(p); // ok, p does not escape thorin()
     thorin(q); // ok
     thorin(r); // ok

     gloin(p); // error, gloin() escapes p
     gloin(q); // error, gloin() escapes q
     gloin(r); // ok that gloin() escapes r

     return p; // ok
     return q; // error, cannot return 'scope' q
     return r; // ok
}
#include <iostream>
using namespace std;
class Base
{
    public:
        virtual void print3i(int a, int b, int c) = 0;
};

class Derived : public Base
{
    public:
        int field;
        Derived(int field) : field(field) {}

        void print3i(int a, int b, int c)
        {
            cout << "a = " << a << endl;
            cout << "b = " << b << endl;
            cout << "c = " << c << endl;
        }

        int mul(int factor);
};

int Derived::mul(int factor)
{
    return field * factor;
}

Derived *createInstance(int i)
{
    return new Derived(i);
}

void deleteInstance(Derived *&d)
{
    delete d;
    d = 0;
}
extern(C++)
{
    abstract class Base
    {
        void print3i(int a, int b, int c);
    }

    class Derived : Base
    {
        int field;
        @disable this();
        override void print3i(int a, int b, int c);
        final int mul(int factor);
    }

    Derived createInstance(int i);
    void deleteInstance(ref Derived d);
}

void main()
{
    import std.stdio;

    auto d1 = createInstance(5);
    writeln(d1.field);
    writeln(d1.mul(4));

    Base b1 = d1;
    b1.print3i(1, 2, 3);

    deleteInstance(d1);
    assert(d1 is null);

    auto d2 = createInstance(42);
    writeln(d2.field);

    deleteInstance(d2);
    assert(d2 is null);
}
import std.stdio: writefln;


void main(string[] args)

{

    foreach (i, arg; args)

        writefln("args[%d] = '%s'", i, arg);

}
import std.stdio, std.algorithm, std.range, std.string;


void main()

{

    dstring[] [dstring] signs2words;


    foreach(dchar[] w; lines(File("words.txt")))

    {

        w = w.chomp().toLower();

        immutable key = w.dup.sort().release().idup;

        signs2words[key] ~= w.idup;

    }


    foreach(words; signs2words)

        if(words.length > 1)

            writefln(words.join(" "));

}
// File version: 1 (October 25th 2019)
// First version: 1 (October 25th 2019)