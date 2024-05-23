import UIKit

// Structure declaration

struct Customer: Decodable {
    var firstName: String
    var lastName: String
    var age: Int
}

// Function declaration with examples of guard statement

func area(height: String, width: String) {
    guard let height = Int(height) else {
        print("height is not a valid number")
        return
    }

    guard let width = Int(width) else {
        print("width is not a valid number")
        return
    }

    print("Area = \(height * width)")
}

// Use "let" to declare a constant.

let maximumCapacity = 10

// Use "var" to declare a variable.

var count = 0

// You can declare multiple constants or variables in
// a single statement.

var x = 0.0, y = 0.0, z = 0.0

// In the examples above, Swift uses "type inference"
// to determine the data type of the constant or variable
// based on the initial value that is supplied.
//
// You can provide a type annotation when you declare a
// constant or variable, to be clear about the kind of
// values the constant or variable can store.

var welcomeMessage: String

welcomeMessage = "Hello"

let emojiText = "🦆🐊"   // Cmd-Ctrl-Space brings up the emoji editor

// You can define multiple related variables of the same
// type on a single line.

var red, green, blue: Double

// Swift has a variety of numeric data types
//
// Integers
//
// Int8   - 8-bit signed integer.
// Int16  - 16-bit signed integer.
// Int32  - 32-bit signed integer.
// Int64  - 64-bit signed integer.
// Int    - Equivalent to either Int32 or Int64, depending
//          on your OS.
// UInt8  - 8-bit unsigned integer.
// UInt16 - 16-bit unsigned integer.
// UInt32 - 32-bit unsigned integer.
// UInt64 - 64-bit unsigned integer.
// UInt   - Equivalent to either UInt32 or UInt64, depending
//          on your OS.
//
// Floating-Point Numbers
//
// Float  - 32-bit floating-point number.
// Double - 64-bit floating-point number.
//
// Booleans
//
// Bool   - true or false.

var isValid: Bool
var isHidden = true

// The print() function can be used to print values and messages to the console.
print(welcomeMessage)
print(count)
print("The value of count =", count)

if isHidden {
    print("The item is hidden")
} else {
    print("The item is visible")
}

// String interpolation can be used to embed the value of a variable in a string when printing
// or assigning it.
print("The value of count = \(count)")

// Optionals
//
// An optional either has a value or is nil. To use an optional, you must unwrap it.

var total: Int?
var average: Double?

let text1 = "12345"
let text2 = "abc"

total = Int(text1)
if (total != nil) {
    print("The total is \(total!)")  // Exclamation point is used to force unwrap an optional.
} else {
    print("Not a valid number")
}

// If you try to force unwrap an optional that is nil, you will get a runtime error.

// "if let" or "if var" can be used to test whether an optional is nil and if not, assign
// its value to another variable.
if let number = Int(text2) {
    print("The numbers is \(number)")
} else {
    print("Not a valid number")
}

// The "guard" statement is often used to test optionals for valid values in called functions.
// See the function definition at the beginning.

area(height: "12", width: "5")

area(height: "abc", width: "10")

// "Optional chaining" is a way to test an optional variable before attempting to access one
// of the variable's properties or methods.

// Define a basic class

class Foo {
    func printMessage() {
        print("The object exists")
    }
}

// Define an optional reference variable of that class type

var myFoo: Foo?

myFoo?.printMessage()    // Does not call method because myFoo is nil

myFoo = Foo()

myFoo?.printMessage()    // Does call method because myFoo is a valid object

// The "nil coalescing operator" ?? can either unwrap an optional if it has a value, or provide a
// default value if the optional is nil.

let newTotal = total ?? 0         // total is not nil, so it is unwrapped and assigned.
let newAverage = average ?? 0     // average is nil, so the default value of 0 is assigned.

print(newTotal, newAverage)

// The do-try-catch structure is another method of handling errors in cases where functions
// throw exceptions. For example:

// Define a valid JSON string as a multi-line string literal and convert it to binary data.

let goodData = """
    {
        "firstName": "John",
        "lastName": "Doe",
        "age": 34
    }
""".data(using: .utf8)!




// Define an invalid JSON string and convert it to binary data.
let badData = "Not valid JSON".data(using: .utf8)!

// Attempting to decode JSON data can throw an exception if the JSON is not valid and cannot
// be successfully parsed. We can use a do-try-catch structure to catch the exception and handle
// the error.
do {
    let customer = try JSONDecoder().decode(Customer.self, from: badData)
    print(customer)
} catch {
    print("Unable to decode JSON")
}

// There are two alternatives to try. The first is try?, which causes a function to return an
// optional rather than throw an exception.
if let customer = try? JSONDecoder().decode(Customer.self, from: goodData) {
    print(customer)
} else {
    print("Unable to decode JSON")
}

// The second alternative is try!, which you can use when you know for sure that the function
//  will not fail. If the function does throw an exception, your code will crash.
let customer = try! JSONDecoder().decode(Customer.self, from: goodData)
print(customer)

// We might use try to attempt to decode JSON downloaded from the internet (which could
// potentially contain an error) and try! to decode JSON included in our app's bundle
// (which we could test and debug ahead of time to ensure that are no errors).
