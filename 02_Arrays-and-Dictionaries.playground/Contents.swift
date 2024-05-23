import UIKit

// Arrays

var array1 = Array<Int>()

var array2 = [Int]()

var array3: [Int] = []
 
var array4 = [2, 4, 6, 8]

var animals = ["Cow", "Duck", "Horse"]

print(array1)
array1.append(7)
print(array1)

print(array4)

var array5 = array4 + array1

print(array5)

print("There are \(animals.count) animals")

if array3.isEmpty {
    print("array3 is empty")
}

animals += ["Sheep", "Pig"]
print(animals)
print(animals[1])

for animal in animals {
    print(animal)
}

// Dictionaries

var dictionary1 = Dictionary<Int, String>()

var dictionary2 = [Int: String]()

var dictionary3: [Int: String] = [:]

var ages = ["John": 23, "Ann": 35, "Sanjay": 18]

ages["Mary"] = 30   // Inserts key and value

// ages["John"] = 25   // Updates value for "John"

print(dictionary1)
print(ages)

if dictionary1.isEmpty {
    print("dictionary1 is empty")
}

if let age = ages["John"] {
    print(age)
} else {
    print("That key does not exist in the dictionary")
}

ages["John"] = 25
if let age = ages["John"] {
    print(age)
} else {
    print("That key does not exist in the dictionary")
}

ages["Larry"] = 42
if let age = ages["Larry"] {
    print(age)
} else {
    print("That key does not exist in the dictionary")
}

if let oldValue = ages.updateValue(50, forKey: "Larry") {
    print("The old age for Larry was \(oldValue)")
}

print(ages["Larry"]!)

ages["Larry"] = nil
print(ages)

if let removedValue = ages.removeValue(forKey: "John") {
    print("The removed person's age is \(removedValue)")
} else {
    print("The ages dictionary does not contain a value for John")
}

print(ages)

ages["Brian"] = 24
ages["Fiona"] = 21
ages["Dan"] = 32

for (name, age) in ages {
    print("\(name): \(age)")
}

for name in ages.keys {
    print("Name: \(name)")
}

for age in ages.values {
    print("Age: \(age)")
}


