// Traditional syntax for enumerated type, in this case, limiting the instances to three objects(for this purpose: Singletons)
abstract class Vehicle(shared String name) of plane | train | automobile {}

object plane extends Vehicle("plane") {}
object train extends Vehicle("train") {}
object automobile extends Vehicle("automobile") {}
// Compile error: type is not a subtype of any case of enumerated supertype: 'boat' inherits 'Vehicle'
//object boat extends Vehicle("boat") {}

// New (as of Ceylon 1.2.0) constructor-based syntax
class Vehicle of plane | train | automobile {
    String name;

    abstract new named(String pName) {
        name = pName;
    }

    shared new plane extends named("plane") {}
    shared new train extends named("train") {}
    shared new automobile extends named("automobile") {}
    // Compile error: value constructor does not occur in of clause of non-abstract enumerated class: 'boat' is not listed in the of clause of 'Vehicle'
    //shared new boat extends named("boat") {}
}

