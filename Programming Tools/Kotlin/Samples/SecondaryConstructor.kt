// Example of class using secondary constructor syntax
// (more than one constructor required for this class)
class MyButton : View {

    // Constructor #1 
    constructor(ctx: Context) : super(ctx) { 
        // ... 
    } 
  
    // Constructor #2
    constructor(ctx: Context, attr: AttributeSet) : super(ctx, attr) { 
        // ... 
    }
}
