//
//  File.swift
//  A4
//
//  Created by Saaduddin Syed on 11/12/23.
//

import Foundation
struct DataModel : Decodable {
    
    var Name : String
    var Number : Int
    var startDate : String
    var endDate : String
    var Nickname : String
    var PoliticalParty : String
    
    private enum CodingKeys: String, CodingKey {
        case Name = "Name"
        case Number = "Number"
        case startDate = "Start Date"
        case endDate = "End Date"
        case Nickname = "Nickname"
        case PoliticalParty = "Political Party"
      }
}
