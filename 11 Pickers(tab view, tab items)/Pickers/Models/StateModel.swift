//
//  StateModel.swift
//  Pickers
//
//  Created by Kurt McMahon on 3/1/22.
//

import Foundation

// The data stored un states (property list) has array --> of dictionaries --> Each dictionary - item 0 etc has --> statename(String) and zipcode (array of strings [String])

// The below code represents one of the 50 dictionaries in array of property list
struct StateModel: Decodable {
    var stateName: String
    var zipCodes: [String]
}
