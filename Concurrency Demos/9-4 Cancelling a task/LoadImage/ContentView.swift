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
            let myTask = Task(priority: .background) {
                let imageName1 = await loadImage(name: "image1")
                print(imageName1)
            }
            Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { timer in
                print("The time is up")
                myTask.cancel()
            }
            
        }
    }
    
    func loadImage(name: String) async -> String {
        try? await Task.sleep(nanoseconds: 3 * 1000000000)
        if !Task.isCancelled {
            return "Name: \(name)"
        } else {
            return "Task Cancelled"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
