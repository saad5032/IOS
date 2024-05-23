import UIKit

// Declaring enumeration types

enum CompassPoint {
    case north
    case south
    case east
    case west
}

enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

// Creating instances of enumeration types

var directionToHead = CompassPoint.west
print("directionToHead is \(directionToHead)")

directionToHead = .east
print("directionToHead is now \(directionToHead)")

// Matching enumeration values with switch

directionToHead = .south
switch directionToHead {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
}

// Iterating over enumeration cases

enum Beverage: CaseIterable {
    case coffee, tea, juice
}

let numberOfChoices = Beverage.allCases.count
print("\(numberOfChoices) beverages available")

for beverage in Beverage.allCases {
    print(beverage)
}
