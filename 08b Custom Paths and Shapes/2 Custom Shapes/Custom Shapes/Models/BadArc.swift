//
//  BadArc.swift
//  Custom Shapes
//
//  Created by Kurt McMahon on 2/15/22.
//

import Foundation
import SwiftUI

struct BadArc: Shape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool

    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)

        return path
    }
}
