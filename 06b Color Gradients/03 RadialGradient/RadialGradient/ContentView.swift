//
//  ContentView.swift
//  RadialGradient
//
//  Created by Kurt McMahon on 2/10/22.
//

import SwiftUI

struct ContentView: View {
    
    let gradient = Gradient(colors: [
        .black,
        .white,
        .blue
    ])

    var body: some View {
        VStack {
            Circle()
                .fill(
                    RadialGradient(gradient: Gradient(colors: [.red, .orange, .yellow, .green, .blue, .purple]), center: .center, startRadius: 20, endRadius: 100)
                )
                .frame(width: 200, height: 200)
                .padding()
            
            RadialGradient(gradient: gradient, center: .center, startRadius: 0.0, endRadius: 100.0)
                 .frame(width: 200, height: 200)
                 .cornerRadius(20)
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
