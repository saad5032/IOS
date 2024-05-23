//: Playground - noun: a place where people can play

import UIKit

// Codable is a combination of Encodable and Decodable
struct Customer : Codable {
    var firstName: String
    var lastName: String
    var age: Int
    
    /*
     * Not actually necessary if JSON names match property names
     *
    private enum CodingKeys: String, CodingKey {
        case firstName
        case lastName
        case age
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.firstName, forKey: .firstName)
        try container.encode(self.lastName, forKey: .lastName)
        try container.encode(self.age, forKey: .age)
    }

     init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.firstName = try container.decode(String.self, forKey: .firstName)
        self.lastName = try container.decode(String.self, forKey: .lastName)
        self.age = try container.decode(Int.self, forKey: .age)
    }
    */
}

let customer = Customer(firstName: "John", lastName: "Doe", age: 45)

let encodedCustomerJSON = try! JSONEncoder().encode(customer)

print(encodedCustomerJSON)

print(String(data: encodedCustomerJSON, encoding: .utf8)!)


