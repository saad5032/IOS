//
//  ContentView.swift
//  Text
//
//  Created by Kurt McMahon on 2/3/22.
//

import SwiftUI

struct ContentView: View {
    
    let name = "Jose"
    let total = 10323.476
    
    var formatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }
    
    var body: some View {
        VStack(spacing: 12) {
            Text("Hello, \(name)")
                .fontWeight(.heavy)
            
            Text("This is a longer string than we've seen previously! It goes on for multiple lines.")
                .foregroundColor(.blue)
                .font(.title3)
                .bold()
                .padding()
                .multilineTextAlignment(.center)

            Text("The total is $\(total, specifier: "%.2f")")
                .font(.title)
                .italic()
            
            Text("The total is \(NSNumber(value: total), formatter: formatter)")
                .foregroundColor(.white)
                .padding(6)
                .background(.red)

            Text("Welcome to SwiftUI")
                .font(.custom("Chalkduster", size: 18))
            
            Text("Here is a new font")
                .font(.custom("Osnabrug", size: 24))

            Text("Here is another new font")
                .font(.custom("BubbleShineRegular", size: 18))
            
            Group {
                Text("Eighth item")
            
                Text ("Ninth item")
            
                Text ("Tenth item")
            
                Text("Eleventh item")
            }
        }
        .onAppear {
            
            // Code to print all of the available font
            // names when the view appears
            
            for fontFamily in UIFont.familyNames {
                for fontName in UIFont.fontNames(forFamilyName: fontFamily) {
                    print("\(fontName)")
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
