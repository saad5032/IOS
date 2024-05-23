//
//  ContentView.swift
//  Custom Paths
//
//  Created by Kurt McMahon on 2/15/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            
        // path initializer takes a closure
        
        Path { path in
            path.move(to: CGPoint(x: 200, y: 100)) // top point of triangle
            path.addLine(to: CGPoint(x: 100, y: 300)) // line from top point to left point
            path.addLine(to: CGPoint(x: 300, y: 300)) // line from left point to right point
            path.addLine(to: CGPoint(x: 200, y: 100)) // line from right to top point. (completes triangle)
            path.addLine(to: CGPoint(x: 100, y: 300))
        }
        .stroke(Color.black, lineWidth: 10)
        //.stroke(Color.blue, style: StrokeStyle(lineWidth: 10, lineCap: .butt, lineJoin: .miter))
    
        
        /*
        
        GeometryReader { geometry in
            
            Path { path in
                path.move(to: CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2 - 100))
                path.addLine(to: CGPoint(x: geometry.size.width / 2 - 100, y: geometry.size.height / 2 + 100))
                path.addLine(to: CGPoint(x: geometry.size.width / 2 + 100, y: geometry.size.height / 2 + 100))
                path.addLine(to: CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2 - 100))
            }
            .fill(.orange)

        }
         
         */
        
        /*
        Path { path in
            path.move(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 300))
            path.addLine(to: CGPoint(x: 300, y: 300))
            path.addLine(to: CGPoint(x: 200, y: 100))
        }
        .fill(Color.blue)
         */
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
