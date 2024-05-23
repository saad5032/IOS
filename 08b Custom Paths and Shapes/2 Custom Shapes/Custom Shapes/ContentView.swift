//
//  ContentView.swift
//  Custom Shapes
//
//  Created by Kurt McMahon on 2/15/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                Triangle()
                    .fill(Color.purple)
                    .frame(width: 100, height: 100)
                    .padding()
                Triangle()
                    .stroke(Color.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                    .frame(width: 100, height: 100)
                    .padding()
            } //: HSTACK
            
            HStack {
                /**
                 Draws from 90° to 200° counterclockwise - WTF???
                
                 1. To SwiftUI, 0° is not straight up, but rather directly to the right.
                 2. Shapes measure their coordinates from the bottom-left corner rather than the top-left corner the way nature intended. 🙄
                */
                BadArc(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true)
                    .stroke(Color.red, lineWidth: 10)
                    .frame(width: 100, height: 100)
                    .padding()
                
                Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true)
                    .stroke(Color.green, lineWidth: 10)
                    .frame(width: 100, height: 100)
                    .padding()
            } //: HSTACK
    
            Circle()
                .strokeBorder(Color.orange, lineWidth: 20)
                .frame(width: 100, height: 100)
                .padding()

            Arc(startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: true)
                .strokeBorder(Color.blue, lineWidth: 20)
                .frame(width: 100, height: 100)
                .padding()

            Spacer()
        } //: VSTACK

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
