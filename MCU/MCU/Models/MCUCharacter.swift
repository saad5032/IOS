//
//  MCUCharacter.swift
//  MCU
//
//  Created by Kurt McMahon on 10/24/23.
//

import Foundation

struct MCUCharacter: Decodable {
    var name = ""
    var realName = ""
    var affiliation = ""
    var url = ""
    
    private enum CodingKeys: String, CodingKey {
        case name = "Name"
        case realName = "Real Name"
        case affiliation = "Affiliation"
        case url = "URL"
    }
}
