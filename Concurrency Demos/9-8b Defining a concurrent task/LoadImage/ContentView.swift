//
//  ContentView.swift
//  LoadImage
//
//  Created by Kurt McMahon on 10/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
        }
        .onAppear {
            let currentTime = Date()
            
            Task(priority: .background) {
                async let imageName1 = await loadImage(name: "image1")
                async let imageName2 = await loadImage(name: "image2")
                async let imageName3 = await loadImage(name: "image3")
                
                let listNames = await "\(imageName1), \(imageName2), \(imageName3)"
                print(listNames)
                print("Total Time: \(Date().timeIntervalSince(currentTime))")
            }
        }
    }
    
    func loadImage(name: String) async -> String {
        try? await Task.sleep(nanoseconds: UInt64.random(in: 1...3) * 1000000000)
        print("Finished loading \(name)")
        return "Name: \(name)"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
