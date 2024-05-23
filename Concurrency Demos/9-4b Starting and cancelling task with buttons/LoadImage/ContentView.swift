//
//  ContentView.swift
//  LoadImage
//
//  Created by Kurt McMahon on 10/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var myTask: Task<(), Never>? = nil
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Button("Start the Task") {
                myTask = Task {
                    let imageName1 = await loadImage(name: "image1")
                    print(imageName1)
                }
            }
            .padding()
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())

            Spacer()
            
            Button("Cancel the Task") {
                if let task = myTask {
                    task.cancel()
                }
            }
            .padding()
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
            
            Spacer()
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
