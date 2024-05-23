import UIKit

// Stored properties can be variables or constants
// property observers, willset,didset
struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

// Every structure type has a built-in initializer that can
// be used to initialize all of its properties.

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)

// Use . notation to access properties.

rangeOfThreeItems.firstValue = 6

// If you create an instance of a structure and assign that
// instance to a constant, you can’t modify the instance's
// properties, even if they were declared as variable
// properties.

let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)

// rangeOfFourItems.firstValue = 6 // Error

// The same is not true of classes, since they are reference
// types.

class Dog {
    var name: String
    var age: Int
    
    // No built-in initializer for class types. We have to
    // write the initializer or provide initial values for all
    // of the properties of the class.
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let myDog = Dog(name: "Axel", age: 7)
myDog.age = 10

// Lazy Properties
//
// A lazy stored property is a property whose initial value
// isn't calculated until the first time it's used. You
// indicate a lazy stored property by writing the lazy
// modifier before its declaration. Only variables may be
// declared to be lazy.

// Computed properties
//
// In addition to stored properties, classes, structures, and
// enumerations can define computed properties, which don't
// actually store a value. Instead, they provide a getter and
// an optional setter to retrieve and set other properties and
// values indirectly.

struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    
    // Computed property
    var center: Point {
        
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        
        // Shorthand getter declaration - no return keyword.
        
        /*
        get {
            Point(x: origin.x + (size.width / 2), y: origin.y + (size.height / 2))
        }
        */
        
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
        
        // Shorthand setter declaration - use default name for
        // the new value, newValue.
        
        /*
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
        */
    }
}

var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center

square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")

// Read-Only Computed Properties
//
// A computed property with a getter but no setter is known as
// a read-only computed property. A read-only computed
// property always returns a value, and can be accessed
// through dot syntax, but can't be set to a different value.

struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    
    var volume: Double {
        return width * height * depth   // return keyword is optional
    }
}

let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")

// Property Observers
//
// Property observers observe and respond to changes in a
// property's value. Property observers are called every time
// a property's value is set, even if the new value is the
// same as the property's current value.
//
// You can add property observers in the following places:
//
// * Stored properties that you define
// * Stored properties that you inherit
// * Computed properties that you inherit
//
// For an inherited property, you add a property observer by
// overriding that property in a subclass. For a computed
// property that you define, use the property's setter to
// observe and respond to value changes, instead of trying to
// create an observer.
//
// You have the option to define either or both of these
// observers on a property:
//
// * willSet is called just before the value is stored.
// * didSet is called immediately after the new value is
//   stored.

class StepCounter {
    var totalSteps: Int = 0 {
        
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        
        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}

let stepCounter = StepCounter()

stepCounter.totalSteps = 200

stepCounter.totalSteps = 360

stepCounter.totalSteps = 896

// Property Wrappers
//
// A property wrapper adds a layer of separation between code
// that manages how a property is stored and the code that
// defines a property. For example, if you have properties
// that provide thread-safety checks or store their underlying
// data in a database, you have to write that code on every
// property. When you use a property wrapper, you write the
// management code once when you define the wrapper, and then
// reuse that management code by applying it to multiple
// properties.
//
// Property wrappers are frequently used in SwiftUI.

@propertyWrapper
struct TwelveOrLess {
    private var number = 0
    var wrappedValue: Int {
        get { return number }
        set { number = min(newValue, 12) }
    }
}

struct SmallRectangle {
    @TwelveOrLess var height: Int
    @TwelveOrLess var width: Int
}

var rectangle = SmallRectangle()
print(rectangle.height)

rectangle.height = 10
print(rectangle.height)

rectangle.height = 24
print(rectangle.height)

// Setting Initial Values for Wrapped Properties
//
// To support setting an initial value or other
// customization, the property wrapper needs to add an
// initializer.

@propertyWrapper
struct SmallNumber {
    private var maximum: Int
    private var number: Int

    var wrappedValue: Int {
        get { return number }
        set { number = min(newValue, maximum) }
    }

    init() {
        maximum = 12
        number = 0
    }
    
    init(wrappedValue: Int) {
        maximum = 12
        number = min(wrappedValue, maximum)
    }
    
    init(wrappedValue: Int, maximum: Int) {
        self.maximum = maximum
        number = min(wrappedValue, maximum)
    }
}

// When you apply a wrapper to a property and you don't
// specify an initial value, Swift uses the init()
// initializer to set up the wrapper.

struct ZeroRectangle {
    @SmallNumber var height: Int
    @SmallNumber var width: Int
}

var zeroRectangle = ZeroRectangle()
print(zeroRectangle.height, zeroRectangle.width)

// When you specify an initial value for the property,
// Swift uses the init(wrappedValue:) initializer to set
// up the wrapper.

struct UnitRectangle {
    @SmallNumber var height: Int = 1
    @SmallNumber var width: Int = 1
}

var unitRectangle = UnitRectangle()
print(unitRectangle.height, unitRectangle.width)

// If you provide an initial value and a maximum value, Swift
// uses the init(wrappedValue:maximum:) initializer.

struct NarrowRectangle {
    @SmallNumber(wrappedValue: 2, maximum: 5) var height: Int
    @SmallNumber(wrappedValue: 3, maximum: 4) var width: Int
}

var narrowRectangle = NarrowRectangle()
print(narrowRectangle.height, narrowRectangle.width)

narrowRectangle.height = 100
narrowRectangle.width = 100
print(narrowRectangle.height, narrowRectangle.width)

// In addition to the wrapped value, a property wrapper can
// expose additional functionality by defining a projected
// value.
//
// In SwiftUI, the projected value is often used to provide
// a binding that lets you bind the wrapped value to something
// else. For example, you can bind a String to a TextField and
// any time new text is typed in the TextField, the String's
// wrapped value will automatically be updated.

// Type Properties
//
// The keyword static can be used to define a type property
// (as opposed to an instance property).
