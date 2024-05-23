//
//  ContentView.swift
//  ForEach
//
//  Created by Kurt McMahon on 2/15/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center) {
// for each generates view x no of times
            
            ForEach((1...10).reversed(), id: \.self) {
                
                // ele in Text("\(ele)") is a closure
                // The id parameter is set to .self, which means each element in the loop is identified by its own value (i.e., each number is treated as a unique identifier).
                
                // closure accepts ele, ele goes through all the items of for loop and using ele, Text view is created number of times equivalent to range given.
                
                ele in Text("\(ele)")
                    .padding(4)
            }
// ($0) is short form of closure.
//            ForEach((1...10).reversed(), id: \.self) {
//                Text("\($0)...")
//                    .padding(4)
//            }
            
            Text("Ready or not, here I come!")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
