//
//  ContentView.swift
//  Color
//
//  Created by Kurt McMahon on 2/8/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(.yellow)
                .ignoresSafeArea()

            VStack {
                Spacer()
                
                ZStack {
                
                    Text("Hello")
                        .font(.largeTitle)
                        .bold()
                        .shadow(color: .black, radius: 3, x: 5, y: 5)

                    Color(red: 123/255, green: 34/255, blue: 107/255)
                        .cornerRadius(12)
                        .opacity(0.6)
                        .frame(width: 100, height: 100)
                        .shadow(color: .black, radius: 3, x: 5, y: 5)
                    
                    
                }
                
                Spacer()
                
                Divider()
                    .padding(.horizontal)
                
                Spacer()
                
                Color(white: 0.6, opacity: 1)
                    .frame(width: 200, height: 200)
                
                Spacer()
            }

        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            //.preferredColorScheme(.dark)
    }
}
