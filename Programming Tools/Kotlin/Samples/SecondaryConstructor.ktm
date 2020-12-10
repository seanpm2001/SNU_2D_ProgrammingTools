 1// Example of class using secondary constructor syntax
 2// (more than one constructor required for this class)
 3class MyButton : View {
 4
 5    // Constructor #1 
 6    constructor(ctx: Context) : super(ctx) { 
 7        // ... 
 8    } 
 9  
10    // Constructor #2
11    constructor(ctx: Context, attr: AttributeSet) : super(ctx, attr) { 
12        // ... 
13    }
14}
