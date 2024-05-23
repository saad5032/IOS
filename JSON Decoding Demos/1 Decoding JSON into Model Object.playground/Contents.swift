//: Playground - noun: a place where people can play

import UIKit

struct Customer : Decodable {
    var firstName: String
    var lastName: String
    var age: Int

    /*
     * Not actually necessary if JSON names match property names
     */
    private enum CodingKeys: String, CodingKey   {
        case firstName = "First Name"
        case lastName = "Last Name"
        case age = "Age"
    }
}

let json = """

{
    "First Name" : "John",
    "Last Name" : "Doe",
    "Age" : 34
}

""".data(using: .utf8)!

let customer = try! JSONDecoder().decode(Customer.self, from: json)
print(customer)
