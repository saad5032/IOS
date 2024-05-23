//
//  ContentView.swift
//  Shapes
//
//  Created by Kurt McMahon on 2/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Capsule(style: .continuous)
                .frame(width: 200, height: 100)
                .foregroundColor(.blue)
            
            Circle()
                .frame(width: 120, height: 120)
                .foregroundColor(.red)
            
            Ellipse()
                .frame(width: 150, height: 100)
                .foregroundColor(.orange)

            HStack(spacing: 30) {
                Rectangle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.green)
                // .cornerRadius(20) will make it same as RoundedRectangle
                
                RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                    .frame(width: 100, height: 100)
                    .foregroundColor(.purple)
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
