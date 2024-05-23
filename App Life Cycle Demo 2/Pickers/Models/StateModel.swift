//
//  StateModel.swift
//  Pickers
//
//  Created by Kurt McMahon on 3/1/22.
//

import Foundation

struct StateModel: Decodable {
    var stateName: String
    var zipCodes: [String]
}
