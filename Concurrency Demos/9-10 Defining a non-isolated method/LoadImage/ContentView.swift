//
//  ContentView.swift
//  LoadImage
//
//  Created by Kurt McMahon on 10/12/23.
//

import SwiftUI

actor ItemData {
    var counter: Int = 0
    let maximum: Int = 50

    func incrementCount() -> String {
        counter += 1
        return "Value: \(counter)"
    }
    
    nonisolated func maximumValue() -> String {
        return "Maximum Value: \(maximum)"
    }
}

struct ContentView: View {
    var item = ItemData()
    
    var body: some View {
        VStack {
            Button("Start Process") {
                let value = item.maximumValue()
                print(value)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
