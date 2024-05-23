//
//  Order.swift
//  Coffee
//
//  Created by Kurt McMahon on 11/9/23.
//

import Foundation

struct Order: Codable {
    let name: String
    let coffeeName: String
    let size: String
    let total: Double
}
