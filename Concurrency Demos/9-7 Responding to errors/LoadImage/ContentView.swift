//
//  ContentView.swift
//  LoadImage
//
//  Created by Kurt McMahon on 10/12/23.
//

import SwiftUI

enum MyErrors: Error {
    case noData, noImage
    
}

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
        }
        .onAppear {
            Task(priority: .background) {
                do {
                    let imageName = try await loadImage(name: "image1")
                    print(imageName)
                } catch MyErrors.noData {
                    print("Error: No Data Available")
                } catch MyErrors.noImage {
                    print("Error: No Image Available")
                }
 
            }
        }
    }
    
    func loadImage(name: String) async throws -> String {
        try? await Task.sleep(nanoseconds: 3 * 1000000000)
        let randomNumber = Int.random(in: 1...3)
        switch randomNumber {
        case 1:
            throw MyErrors.noData
        case 2:
            throw MyErrors.noImage
        default:
            return "Name: \(name)"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
