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
            Task(priority: .background) {
                let imageName1 = await loadImage(name: "image1")
                print(imageName1)
            }
        }
    }
    
    func loadImage(name: String) async -> String {
        let result = Task(priority: .background) {
            () -> String in
            let imageData = await getMetadata()
            return "Name: \(name) Size: \(imageData)"
        }
        let message = await result.value
        return message
    }
    
    func getMetadata() async -> Int {
        try? await Task.sleep(nanoseconds: 3 * 1000000000)
        return 50000
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
