import UIKit

struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

enum CompassPoint {
    case north, south, east, west
    mutating func turnNorth() {
        self = .north
    }
}

// Creating instances

let someResolution = Resolution()
let someVideoMode = VideoMode()
var currentDirection = CompassPoint.west

// Accessing properties using dot notation

print("The width of someResolution is \(someResolution.width)")
print("The width of someVideoMode is \(someVideoMode.resolution.width)")
print("The current direction is \(currentDirection)")

someVideoMode.resolution.width = 1280
print("The width of someVideoMode is now \(someVideoMode.resolution.width)")

// Memberwise initializer for struct

let vga = Resolution(width: 640, height: 480)
print("The width of vga is \(vga.width)")

// Structures and enumerations are value types

let hd = Resolution(width: 1920, height: 1080)
var cinema = hd

cinema.width = 2048
print("cinema is now \(cinema.width) pixels wide")
print("hd is still \(hd.width) pixels wide")

let rememberedDirection = currentDirection
currentDirection.turnNorth()
print("The current direction is now \(currentDirection)")
print("The remembered direction is still \(rememberedDirection)")

// Stored properties of constant structure instances

// hd.width = 720

// Classes are reference types

let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")

// Identity operators

if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance")
}

if tenEighty !== alsoTenEighty {
    print("tenEighty and alsoTenEighty do not refer to the same VideoMode instance")
}

// Initialization

struct Celsius {
    var temperatureInCelsius: Double
    
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    
    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }
}

let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
let freezingPointOfWater = Celsius(fromKelvin: 273.15)
let bodyTemperature = Celsius(37.0)

print(boilingPointOfWater.temperatureInCelsius)
print(freezingPointOfWater.temperatureInCelsius)

// Failable initializers

struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty { return nil }
        self.species = species
    }
}

let someCreature = Animal(species: "Giraffe")

if let giraffe = someCreature {
    print("An animal was initialized with a species of \(giraffe.species)")
}

let anonymousCreature = Animal(species: "")

if anonymousCreature == nil {
    print("The anonymous creature could not be initialized")
}
