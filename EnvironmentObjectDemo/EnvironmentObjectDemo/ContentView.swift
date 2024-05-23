//
//  ContentView.swift
//  EnvironmentObjectDemo
//
//  Created by Kurt McMahon on 3/22/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            IncrementView()
                .tabItem  {
                    Label("Increment", systemImage: "plus.circle")
                }
            DecrementView()
                .tabItem  {
                    Label("Decrement", systemImage: "minus.circle")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
