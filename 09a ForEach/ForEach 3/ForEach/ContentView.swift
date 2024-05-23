//
//  ContentView.swift
//  ForEach
//
//  Created by Kurt McMahon on 2/15/22.
//

import SwiftUI

struct SimpleGameResult //Identifiable// if i use identifiable here then i dont need to specify \.id in for each below
{
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
            // i cannot use id:self as items in result array are not unique(there are two 8's) so instead self i use UUID() which i defined in struct SimpleGameResult.
            
            // I am calling this struct in results array and passing the items 8,5,10,8 as parameters to this struct, so that this struct will accepts the items as Int ( let score: Int) and assign a unique id to this items ( let id = UUID())
            
            ForEach(results, id: \.id) { result in
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
