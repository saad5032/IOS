//
//  ContentView.swift
//  LinearGradient
//
//  Created by Kurt McMahon on 2/10/22.
//

import SwiftUI

struct ContentView: View {
    
    let gradient = Gradient(colors: [
        .black,
        .red
    ])
    
    var body: some View {
        VStack {
            HStack {
                
                Spacer()
                
                VStack(alignment: .center) {
                    LinearGradient(gradient: gradient, startPoint: .bottomLeading, endPoint: .topTrailing)
                    .frame(width: 100, height: 100)
                    .cornerRadius(20)
                    
                    Text(".bottomLeading\nto\n.topTrailing")
                        .font(.caption)
                        .multilineTextAlignment(.center)
                }
                
                Spacer()
                
                VStack {
                    LinearGradient(gradient: gradient, startPoint: .bottomTrailing, endPoint: .topLeading)
                    .frame(width: 100, height: 100)
                    .cornerRadius(20)
                    
                    Text(".bottomTrailing\nto\n.topLeading")
                        .font(.caption)
                        .multilineTextAlignment(.center)
                }
                
                Spacer()
            }
            
            HStack {
                Spacer()
                
                VStack(alignment: .center) {
                    LinearGradient(gradient: gradient, startPoint: .leading, endPoint: .trailing)
                    .frame(width: 100, height: 100)
                    .cornerRadius(20)
                    
                    Text(".leading\nto\n.trailing")
                        .font(.caption)
                        .multilineTextAlignment(.center)
                }
                
                Spacer()
                
                VStack {
                    LinearGradient(gradient: gradient, startPoint: .trailing, endPoint: .leading)
                    .frame(width: 100, height: 100)
                    .cornerRadius(20)
                    
                    Text(".trailing\nto\n.leading")
                        .font(.caption)
                        .multilineTextAlignment(.center)
                }
                Spacer()
            }
            
            HStack {
                Spacer()
                
                VStack(alignment: .center) {
                    LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom)
                    .frame(width: 100, height: 100)
                    .cornerRadius(20)
                    
                    Text(".top\nto\n.bottom")
                        .font(.caption)
                        .multilineTextAlignment(.center)
                }
                
                Spacer()
                
                VStack {
                    LinearGradient(gradient: gradient, startPoint: .bottom, endPoint: .top)
                    .frame(width: 100, height: 100)
                    .cornerRadius(20)
                    
                    Text(".bottom\nto\n.top")
                        .font(.caption)
                       .multilineTextAlignment(.center)
                }
                Spacer()
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
