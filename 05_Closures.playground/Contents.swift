import UIKit

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]


// We can define a function and then pass that function to
// another function that takes a fnction type as a parameter.

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

var reversedNames: [String]
    
reversedNames = names.sorted(by: backward)

// A shorter and easier option is to pass a closure.
//
// Closure syntax:
//
// { (parameters) -> return_type in
//     statements
// }

reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})

// Inferring Type from Context
//
// Because the sorting closure is passed as an argument to a
// method, Swift can infer the data types of its parameters and
// the data type of the value it returns.

reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 } )

// Implicit Returns from Single-Expression Closures
//
// Single-expression closures can implicitly return the result
// of their single expression by omitting the return keyword
// from their declaration.

reversedNames = names.sorted(by: { s1, s2 in s1 > s2 } )

// Shorthand Argument Names
//
// Swift automatically provides shorthand argument names to
// inline closures, which can be used to refer to the values of
// the closure’s arguments by the names $0, $1, $2, and so on.
//
// If you use these shorthand argument names within your
// closure expression, you can omit the closure’s argument list
// from its definition. The type of the shorthand argument
// names is inferred from the expected function type, and the
// highest numbered shorthand argument you use determines the
// number of arguments that the closure takes. The in keyword
// can also be omitted, because the closure expression is made
// up entirely of its body:”

reversedNames = names.sorted(by: { $0 > $1 } )

// Trailing Closures
// If you need to pass a closure expression to a function as
// the function’s final argument and the closure expression is
// long, it can be useful to write it as a trailing closure
// instead. You write a trailing closure after the function
// call's parentheses, even though the trailing closure is
// still an argument to the function. When you use the trailing
// closure syntax, you don’t write the argument label for the
// first closure as part of the function call.

reversedNames = names.sorted() { $0 > $1 }

// If a closure expression is provided as the function's or
// method's only argument and you provide that expression as a
// trailing closure, you don’t need to write a pair of
// parentheses () after the function or method’s name when you
// call the function.

reversedNames = names.sorted { $0 > $1 }

// Trailing closures are most useful when the closure is
// sufficiently long that it isn't possible to write it inline
// on a single line.

let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

// Use map(_:) method with trailing closure to convert an array
// of Int values into an array of String values.

let strings = numbers.map { (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}

// Capturing Values
//
// A closure can capture constants and variables from the
// surrounding context in which it's defined. The closure can
// then refer to and modify the values of those constants and
// variables from within its body, even if the original scope
// that defined the constants and variables no longer exists.
//
// In Swift, the simplest form of a closure that can capture
// values is a nested function, written within the body of
// another function. A nested function can capture any of its
// outer function's arguments and can also capture any
// constants and variables defined within the outer function.

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)

print(incrementByTen())
print(incrementByTen())
print(incrementByTen())

let incrementBySeven = makeIncrementer(forIncrement: 7)
print(incrementBySeven())

print(incrementByTen())

// Closures are reference types.

let alsoIncrementByTen = incrementByTen

print(alsoIncrementByTen())
print(incrementByTen())

//Escaping Closures
//
// A closure is said to escape a function when the closure is
// passed as an argument to the function, but is called after
// the function returns. When you declare a function that takes
// a closure as one of its parameters, you can write @escaping
// before the parameter’s type to indicate that the closure is
// allowed to escape.
//
// One way that a closure can escape is by being stored in a
// variable that’s defined outside the function. As an example,
// many functions that start an asynchronous operation take a
// closure argument as a completion handler. The function
// returns after it starts the operation, but the closure isn't
// called until the operation is completed — the closure needs
// to escape, to be called later. For example:

var completionHandlers = [() -> Void]()
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

// An escaping closure that refers to self needs special
// consideration if self refers to an instance of a class.
// Capturing self in an escaping closure makes it easy to
// accidentally create a strong reference cycle.
//
// Normally, a closure captures variables implicitly by using
// them in the body of the closure, but in this case you need
// to be explicit. If you want to capture self, write self
// explicitly when you use it, or include self in the closure's
// capture list. Writing self explicitly lets you express your
// intent, and reminds you to confirm that there isn't a
// reference cycle.

func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)

completionHandlers.first?()
print(instance.x)

// Capture self by including it in the closure’s capture list.

class SomeOtherClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { [self] in x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}

// If self is an instance of a structure or an enumeration, you
// can always refer to self implicitly. However, an escaping
// closure can’t capture a mutable reference to self when self
// is an instance of a structure or an enumeration. ”
