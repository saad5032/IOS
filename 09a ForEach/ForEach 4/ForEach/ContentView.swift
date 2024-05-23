//
//  ContentView.swift
//  ForEach
//
//  Created by Kurt McMahon on 2/15/22.
//

import SwiftUI

struct SimpleGameResult: Identifiable {
    let id = UUID()
    let score: Int
}

struct ContentView: View {
    
    let results = [
        SimpleGameResult(score: 8),
        SimpleGameResult(score: 5),
        SimpleGameResult(score: 10),
        SimpleGameResult(score: 8)
    ]
    
    var body: some View {
        
        VStack {
            ForEach(results) { result in
                Text("Result: \(result.score)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
