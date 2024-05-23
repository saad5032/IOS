//: Playground - noun: a place where people can play

import UIKit

// reference - useyourloaf.com
extension DateFormatter {
    static let MMddyyyy: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter
    }()
}

struct Geo : Decodable {
    var latitude: Double
    var longitude: Double
}

struct Address : Decodable {
    var street: String
    var city: String
    var state: String
    var geo: Geo
}

struct Customer : Decodable {
    var firstName: String
    var lastName: String
    var address: Address
    var dateCreated: Date
}

struct CustomerResponse : Decodable {
    var customers: [Customer]
}

/**
 * .iso8601 - 1996-12-19T16:39:57-08:00
 *
 */


let json = """

{
    "customers" : [
        {
            "firstName" : "John",
            "lastName" : "Doe",
            "dateCreated" : "1996-12-19T16:39:57-08:00",
            "address" : {
                "street" : "1200 Richmond Ave",
                "city" : "Houston",
                "state" : "TX",
                "geo" : {
                    "latitude" : 34.56,
                    "longitude" : 35.65
                }
            }
        }
    ]
}

""".data(using: .utf8)!

let decoder = JSONDecoder()
decoder.dateDecodingStrategy = .iso8601
//decoder.dateDecodingStrategy = .formatted(DateFormatter.MMddyyyy)

let customersResponse = try! decoder.decode(CustomerResponse.self, from: json)
print(customersResponse)

