//
//  ContentView.swift
//  ObservedObjectDemo
//
//  Created by Kurt McMahon on 3/22/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var userSettings  = UserSettings()
    
    var body: some View {
        TabView {
            IncrementView(userSettings: userSettings)
                .tabItem  {
                    Label("Increment", systemImage: "plus.circle")
                }
            DecrementView(userSettings: userSettings)
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
