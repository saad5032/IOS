//
//  ContentView.swift
//  LoadImage
//
//  Created by Kurt McMahon on 10/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var text = ""
    
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
            
            Button("Press Me") {
                text = "Button pressed"
            }
            .padding()
            
            Text(text)
                .padding()
        }
        .task(priority: .background) {
            let imageName = await loadImage(name: "image1")
            print(imageName)
        }
    }
    
    func loadImage(name: String) async -> String {
        try? await Task.sleep(nanoseconds: 3 * 1000000000)
        return "Name: \(name)"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
