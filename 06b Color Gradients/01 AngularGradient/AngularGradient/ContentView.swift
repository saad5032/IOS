//
//  ContentView.swift
//  AngularGradient
//
//  Created by Kurt McMahon on 2/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Circle()
                .fill(
                    AngularGradient(gradient: Gradient(colors: [.red, .orange, .yellow, .green, .blue, .purple, .red]), center: .center))
                .frame(width: 200, height: 200)
                .padding()
            
            Circle()
                .strokeBorder(
                    AngularGradient(gradient: Gradient(colors: [.red,.orange,  .yellow, .green, .blue, .purple, .red]), center: .center, startAngle: .zero, endAngle: .degrees(360)),
                    lineWidth: 10  // --> you can adjust the thickness of circle.
                )
                .frame(width: 200, height: 200)
                .padding()
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
