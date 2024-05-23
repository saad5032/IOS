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
                let imageName1 = await loadImage(name: "image1")
                let imageName2 = await loadImage(name: "image2")
                let imageName3 = await loadImage(name: "image3")
                print("\(imageName1),\(imageName2),\(imageName3)")
                print("Total Time: \(Date().timeIntervalSince(currentTime))")
            }
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
