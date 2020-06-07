// Start of script
/* Sample swift program
Scripts taken from: https://en.wikipedia.org/wiki/Swift_(programming_language)
File version: 1 (October 12th 2019)
Latest version: 1 (October 12th 2019)
First version: 1 (October 12th 2019)
*/
/* File Stats
File type: *.swift (Apple Swift programming language file)
Size: 001,.577 bytes (001,.577 Kilobytes)
Line count: 55
Language: Swift
*/
// Hello world program
var str = "hello,"
str += " world"
// Optionals and chaining
let myValue = anOptionalInstance!.someMethod()
// Optical chaining
let myValue = anOptionalInstance?.someMethod()
// Chaining
let aTenant = aBuilding.TenantList[5]
let theirLease = aTenant.leaseDetails
let leaseStart = theirLease?.startDate
// Chaining reduction
let leaseStart = aBuilding.TenantList[5].leaseDetails?.startDate
// Guard
guard let leaseStart = aBuilding.TenantList[5]?.leaseDetails?.startDate else
{
    //handle the error case where anything in the chain is nil
    //else scope must exit the current method or loop
}
//continue, knowing that leaseStart is not nil
// Untitled example
leaseStart = [[[aBuilding tenantList:5] leaseDetails] startDate]
// Protocol
protocol StringConvertible
{
    func toString() -> String
}
// Extension
extension String: StringConvertible
{
    func toString() -> String
    {
        self
    }
}
// Variable converting string
var someSortOfPrintableObject: StringConvertible
...
print(someSortOfPrintableObject.toString())
// Func to Bool
func !=<T : Equatable>(lhs: T, rhs: T) -> Bool
// End of script