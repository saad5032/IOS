//
//  Hike.swift
//  Hiking
//
//  Created by Kurt McMahon on 3/9/23.
//

import Foundation
import SwiftUI // to have UI image - binary representation of an image.

struct Hike {
    let name: String
    let image: UIImage
    let miles: Double
}

extension Hike {
    static func all() -> [Hike] {
        return [
            // now i can use UIImage constructor, i am gonna force unwrap as i know there is image.
            // In hikecell, hike.imagename will not work instead Image(uiImage : hike.image)
            Hike(name: "Imaginary Trail", image: UIImage(named: "hike1")!, miles: 6),
            Hike(name: "Mount Nowhere", image: UIImage(named: "hike2")!, miles: 5.8),
            Hike(name: "Road to Nowhere", image: UIImage(named: "hike3")!, miles: 4),
            Hike(name: "Nevermind State Park", image: UIImage(named: "hike4")!, miles: 6.1),
            Hike(name: "Who Cares Lake", image: UIImage(named: "hike5")!, miles: 7),
            Hike(name: "Madeup Falls", image: UIImage(named: "hike6")!, miles: 2.1),
            Hike(name: "Out of Ideas Park", image: UIImage(named: "hike7")!, miles: 5.2),
            Hike(name: "Really Reaching Now Trail", image: UIImage(named: "hike8")!, miles: 7.3)
        ]
    }
}
