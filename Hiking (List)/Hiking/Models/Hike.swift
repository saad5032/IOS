//
//  Hike.swift
//  Hiking
//
//  Created by Kurt McMahon on 3/9/23.
//

import Foundation

struct Hike {
    let name: String
    let imageName: String
    let miles: Double
}

extension Hike {
    static func all() -> [Hike] {
        return [
            Hike(name: "Imaginary Trail", imageName: "hike1", miles: 6),
            Hike(name: "Mount Nowhere", imageName: "hike2", miles: 5.8),
            Hike(name: "Road to Nowhere", imageName: "hike3", miles: 4),
            Hike(name: "Nevermind State Park", imageName: "hike4", miles: 6.1),
            Hike(name: "Who Cares Lake", imageName: "hike5", miles: 7),
            Hike(name: "Madeup Falls", imageName: "hike6", miles: 2.1),
            Hike(name: "Out of Ideas Park", imageName: "hike7", miles: 5.2),
            Hike(name: "Really Reaching Now Trail", imageName: "hike8", miles: 7.3)
        ]
    }
}
