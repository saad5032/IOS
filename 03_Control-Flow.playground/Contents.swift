import UIKit

// Loops

let names = ["Anna", "Alex", "Brian", "Jack"]

// for-in loop can be used to iterate over a sequence.

for name in names {
    print("Hello, \(name)")
}

let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]

for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}

// Can also be used with numeric ranges. The operator "..."
// denotes a closed range, while "..<" denotes a half-open
// range.

for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)")

let minutes = 5
for tickMark in 0..<minutes {
    print(tickMark)
}

// The stride(from:to:by:) function returns a half-open range.
let minuteInterval = 5
for tickMark in stride(from: 0, to: 20, by: minuteInterval) {
    print(tickMark)
}

// The stride(from:through:by:) function returns a closed range.
for tickMark in stride(from: 0, through: 20, by: minuteInterval) {
    print(tickMark)
}

// The while loop is similar to the one found in other programming
// languages like C++ and Java.

// The repeat-while loop is a bottom-driven loop similar to the
// C++ do-while loop.

var i = 0
repeat {
    print("Hello")
    i += 1
} while i < 3

// Decisions

// The if statement (and its variations) are similar to the ones
// found in other programming languages.

// Switch

// The switch statement in Swift has no implicit fallthrough, so
// no "break" statements are required. Compound cases are possible.

let someCharacter: Character = "z"
switch someCharacter {
case "a", "A":
    print("The first letter of the alphabet")
case "z", "Z":
    print("The last letter of the alphabet")
default:
    print("Some other character")
}

// A switch statement can test a value for inclusion in an interval.

let approximateCount = 62
let countedThings = "moons orbiting Saturn"
let naturalCount: String

switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).")

// You can use tuples to test multiple values in the same switch
// statement. The underscore character (_) matches any possible
// value.

let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("\(somePoint) is at the origin")
case (_, 0):
    print("\(somePoint) is on the x-axis")
case (0, _):
    print("\(somePoint) is on the y-axis")
case (-2...2, -2...2):
    print("\(somePoint) is inside the box")
default:
    print("\(somePoint) is outside of the box")
}

let name = "John"
switch name {
case _:
    print("Match!")
}


// A switch case can name the value or values it matches to temporary
// constants or variables, for use in the body of the case. This behavior
// is known as value binding, because the values are bound to temporary
// constants or variables within the case’s body.”

let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}

// A switch case can use a where clause to check for additional
// conditions.

let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}
