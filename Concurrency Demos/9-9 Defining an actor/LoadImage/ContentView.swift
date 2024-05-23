//
//  ContentView.swift
//  LoadImage
//
//  Created by Kurt McMahon on 10/12/23.
//

import SwiftUI

actor ItemData {
    var name: String
    var counter: Int
    
    init(name: String) {
        self.name = name
        self.counter = 0
    }
    
    func changeName(newName: String) {
        name = newName
        counter += 1
    }
}

struct ContentView: View {
    var item = ItemData(name: "Undefined")
    
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
        }
        .onAppear {
            Task(priority: .background) {
                async let imageName1 = loadImage(name: "potatoes")
                async let imageName2 = loadImage(name: "milk")
                async let imageName3 = loadImage(name: "orange")

                let listNames = await "\(imageName1),\(imageName2),\(imageName3)"
                print(listNames)
            }
        }
    }
    
    func loadImage(name: String) async -> String {
        await item.changeName(newName: name)
        let count = await item.counter
        return "Name: \(name) \(count)"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
