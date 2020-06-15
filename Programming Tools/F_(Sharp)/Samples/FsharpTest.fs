// most scripts taken and expanded from https://en.wikipedia.org/wiki/F_Sharp_(programming_language)
// File info
// Type: .fs file (F# programming language file)
// First version: 1 (October 11th 2019)
// Latest version: 1 (October 11th 2019)
// Current version: 1 (October 11th 2019)
// start of script
// expressive calculation
let x = 3 + 4
// record = R
type R = 
        { Name : string 
         Age : int }
// discriminated union
type A =
    | UnionCaseX of string
    | UnionCaseY of int
// sequence expression
seq { for b in 0 .. 25 do
           if b < 15 then
               yield b*b }
// mutable record
// Define 'x' with initial value '1'
let mutable x = 1
// Change the value of 'x' to '3'
x <- 3
/// A simple object type definition
type Person(name : string, age : int) =
    member x.Name = name
    member x.Age = age
// asynchronous programming
let asynctask = 
    async { let req = WebRequest.Create(url)
            let! response = req.GetResponseAsync()
            use stream = response.GetResponseStream()
            use streamreader = new System.IO.StreamReader(stream)
            return streamreader.ReadToEnd() }
// quotation and computation
// Use the OData type provider to create types that can be used to access the Northwind database.
open Microsoft.FSharp.Data.TypeProviders
type Northwind = ODataService<"http://services.odata.org/Northwind/Northwind.svc">
let db = Northwind.GetDataContext()
// A query expression.
let query1 = query { for customer in db.Customers do
                     select customer }
// Agent/actor programming
let counter =
    MailboxProcessor.Start(fun inbox ->
        let rec loop n =
            async { do printfn "n = %d, waiting..." n
                    let! msg = inbox.Receive()
                    return! loop(n+msg) }
        loop 0)
// This is a comment for a sample hello world program.
open System
Console.WriteLine("Hello World!")
/// This is a documentation comment for a type definition.
type Person(name : string, age : int) =
    member x.Name = name
    member x.Age = age
/// class instantiation
let mrSmith = Person("Smith", 42)
/// Using pattern matching expression
let rec factorial n =
    match n with
    | 0 -> 1
    | _ -> n * factorial (n - 1)
/// For a single-argument functions there is syntactic sugar (pattern matching function):
let rec factorial = function 
    | 0 -> 1 
    | n -> n * factorial (n - 1)
/// Using fold and range operator
let factorial n = [1..n] |> Seq.fold (*) 1
/// Iteration using a 'for' loop
let printList lst = 
    for x in lst do
        printfn "%d" x
/// Iteration using a higher-order function
let printList2 lst = 
    List.iter (printfn "%d") lst
/// Iteration using a recursive function and pattern matching
let rec printList3 lst =
    match lst with
    | [] -> ()
    | h :: t ->
        printfn "%d" h
        printList3 t
	/// Fibonacci Number formula
let fib n =
    let rec g n f0 f1 =
        match n with
        | 0 -> f0
        | 1 -> f1
        | _ -> g (n - 1) f1 (f0 + f1)
    g n 0 1
/// Another approach - a lazy infinite sequence of Fibonacci numbers
let fibSeq = Seq.unfold (fun (a,b) -> Some(a+b, (b, a+b))) (0,1)
// Print even fibs
[1 .. 10]
|> List.map     fib
|> List.filter  (fun n -> (n % 2) = 0)
|> printList
// Same thing, using a list expression
[ for i in 1..10 do
    let r = fib i
    if r % 2 = 0 then yield r ]
|> printList
// Open the Windows Forms library
open System.Windows.Forms
// Create a window and set a few properties
let form = new Form(Visible=true, TopMost=true, Text="Welcome to F#")
// Create a label to show some text in the form
let label =
    let x = 3 + (4 * 5)
    new Label(Text = sprintf "x = %d" x)
// Add the label to the form
form.Controls.Add(label)
// Finally, run the form
[<System.STAThread>]
Application.Run(form)
/// A simple prime number detector
let isPrime (n:int) =
   let bound = int (sqrt (float n))
   seq {2 .. bound} |> Seq.forall (fun x -> n % x <> 0)
// We are using async workflows
let primeAsync n =
    async { return (n, isPrime n) }
/// Return primes between m and n using multiple threads
let primes m n =
    seq {m .. n}
        |> Seq.map primeAsync
        |> Async.Parallel
        |> Async.RunSynchronously
        |> Array.filter snd
        |> Array.map fst
// Run a test
primes 1000000 1002000
    |> Array.iter (printfn "%d")
// end of script
