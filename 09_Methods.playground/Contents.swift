import UIKit

// Instance methods
// mutating method allows you to modify properties of struct and enum
class Counter {
    var count = 0
    
    func increment() {
        // self.count += 1
        count += 1
    }
    
    func increment(by amount: Int) {
        count += amount
    }
    
    func reset() {
        count = 0
    }
}

let counter = Counter()
counter.increment()
counter.increment(by: 5)
counter.reset()

// The self implicit property

struct Point {
    var x = 0.0, y = 0.0
    
    func isToTheRightOf(x: Double) -> Bool {
        return self.x > x
    }
    
    // A method that modifies the properties of a value type must be
    // specified as "mutating".
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
    
    // Alternate approach - assign a new Point to self
    /*
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        self = Point(x: x + deltaX, y: y + deltaY)
    }
    */
}

let somePoint = Point(x: 4.0, y: 5.0)

if somePoint.isToTheRightOf(x: 1.0) {
    print("This point is to the right of the line where x == 1.0")
}

var anotherPoint = Point(x: 1.0, y: 1.0)
anotherPoint.moveBy(x: 2.0, y: 3.0)
print("The point is now at (\(anotherPoint.x), \(anotherPoint.y))")

enum TriStateSwitch {
    case off, low, high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}
var ovenLight = TriStateSwitch.low
ovenLight.next()
ovenLight.next()
