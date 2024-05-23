//: Playground - noun: a place where people can play

import UIKit

struct PlacesResponse : Decodable {
    var places: [Place]
}

struct Place : Decodable {
    var name: String
    var latitude: Double
    var longitude: Double
    var visited: Bool
}

let json = """
{
    "places" : [
        {
            "name" : "San Jose, Costa Rica",
            "latitude" : 9.56,
            "longitude" : 84.5,
            "visited" : true
        },
        {
            "name" : "San Juan, Puerto Rico",
            "latitude" : 18.24,
            "longitude" : 66.3,
            "visited" : true
        },
        {
            "name" : "Mexico City, Mexico",
            "latitude" : 19.26,
            "longitude" : 99.8,
            "visited" : true
        },
        {
            "name" : "Reykjavik, Iceland",
            "latitude" : 64.08,
            "longitude" : 21.56,
            "visited" : false
        }
    ]
}

""".data(using: .utf8)!

let placesResponse = try! JSONDecoder().decode(PlacesResponse.self, from: json)
print(placesResponse.places)
