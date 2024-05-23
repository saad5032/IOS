//
//  ContentView.swift
//  Image
//
//  Created by Kurt McMahon on 2/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            ZStack {
                Image("tree") // bottom
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 200, height: 200)
                    //.scaledToFit()
                    //.scaledToFill()
                    .padding()
                Text("TREE") // Text will be on top
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                    .padding()
            }

            Image(systemName: "calendar.circle.fill")
                .imageScale(.large)
                .foregroundColor(.blue)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
