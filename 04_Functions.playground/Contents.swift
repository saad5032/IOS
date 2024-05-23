import UIKit

// Functions

// Function with a single parameter and a return value.

func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}

var x = "0.00"
func g(){
    var result = 6.6
    x=String(format:"%.2f", result)
}
g()

print(greet(person: "Anna"))
print(greet(person: "Brian"))

// Alternate version

func greetAgain(person: String) -> String {
    return "Hello again, " + person + "!"
}

print(greetAgain(person: "Anna"))

// Function with no parameters.

func sayHelloWorld() -> String {
    "hello, world"     // return keyword is optional for one-line function body
}
print(sayHelloWorld())

// Function with multiple parameters.

func greet2(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}

print(greet2(person: "Tim", alreadyGreeted: true))

// Function with no return value.

func greet3(person: String) {
    print("Hello, \(person)!")
}

greet3(person: "Dave")

// Each function parameter has both an argument label and a parameter
// name. The argument label is used when calling the function; each
// argument is written in the function call with its argument label
// before it. The parameter name is used in the implementation of the
// function. By default, parameters use their parameter name as their
// argument label.

// To specify an argument label different than the parameter name, you
// write an argument label before the parameter name, separated by a
// space.

func someFunction(argumentLabel parameterName: Int) {
    // In the function body, parameterName refers to the argument value
    // for that parameter.
}

// Example:

func greet4(person: String, from hometown: String) -> String {
    return "Hello \(person)!  Glad you could visit from \(hometown)."
}

print(greet4(person: "Bill", from: "Cupertino"))

// If you don’t want an argument label for a parameter, write an
// underscore (_) instead of an explicit argument label for that
// parameter.

// If a parameter has an argument label, the argument must be labeled
// when you call the function.

func greet5(_ person: String, from hometown: String) -> String {
    return "Hello \(person)!  Glad you could visit from \(hometown)."
}

print(greet5("Bill", from: "Cupertino"))

// You can define a default value for any parameter in a function by
// assigning a value to the parameter after that parameter’s type. If a
// default value is defined, you can omit that parameter when calling
// the function.

func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
    // If you omit the second argument when calling this function, then
    // the value of parameterWithDefault is 12 inside the function body.
}

// parameterWithDefault is 6
someFunction(parameterWithoutDefault: 3, parameterWithDefault: 6)

// parameterWithDefault is 12
someFunction(parameterWithoutDefault: 4)

// Place parameters that don’t have default values at the beginning of a
// function’s parameter list, before the parameters that have default
// values.

// Variadic Parameters
//
// A variadic parameter accepts zero or more values of a specified type.
// You use a variadic parameter to specify that the parameter can be
// passed a varying number of input values when the function is called.
// Write variadic parameters by inserting three period characters (...)
// after the parameter’s type name.
//
// The values passed to a variadic parameter are made available within
// the function’s body as an array of the appropriate type. For example,
// a variadic parameter with a name of numbers and a type of Double...
// is made available within the function’s body as a constant array
// called numbers of type [Double].

func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}

print(arithmeticMean(1, 2, 3, 4, 5))
print(arithmeticMean(3, 8.25, 18.75))

// In-Out Parameters
//
// Function parameters are constants by default. Trying to change the
// value of a function parameter from within the body of that function
// results in a compile-time error. This means that you can’t change the
// value of a parameter by mistake. If you want a function to modify a
// parameter’s value, and you want those changes to persist after the
// function call has ended, define that parameter as an in-out parameter
// instead.

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107

swapTwoInts(&someInt, &anotherInt)

print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

// Function Types

// Every function has a specific function type, made up of the parameter
// types and the return type of the function. For example:
//
// () -> Void                   No parameters, returns Void / nothing
// (Int) -> Int                 Int parameter, returns an Int
// (String, Int) -> Double      String and Int parameters, returns Double
//
// Function types can be passed to other functions or returned from
// functions.
