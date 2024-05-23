//
//  ContentView.swift
//  LoadImage
//
//  Created by Kurt McMahon on 10/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var myText: String = "Hello, world!"
    
    var body: some View {
        VStack {
            Text(myText)
                .padding()
        }
        .onAppear {
            let currentTime = Date()

            Task(priority: .background) {
                await loadImage(name: "image1")
            }
        }
    }
    
    func loadImage(name: String) async {
        let result: String = await MainActor.run {
            myText = name
            return "Name: \(name)"
        }
        print(result)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
