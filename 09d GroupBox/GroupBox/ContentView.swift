//
//  ContentView.swift
//  GroupBox
//
//  Created by Kurt McMahon on 2/16/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            
            GroupBox("Title of the box") {
                Text("Here is some text for the group box. It is quite long and there is a lot.")
            }
            .padding(.horizontal)
            
            GroupBox(label: Label("Heart Rate", systemImage: "heart.fill")
                .foregroundColor(.red)
            ) {
                Text("Your heart rate is 90 BPM.")
            }
            //.groupBoxStyle(.automatic)
            .frame(width: 250)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
