//
//  ContentView.swift
//  ForEach
//
//  Created by Kurt McMahon on 2/15/22.
//

import SwiftUI

struct ContentView: View {
    
    let colors: [Color] = [.red, .green, .blue]
    
    var body: some View {
        
        VStack {
            // colors is an array and and items of array are unique so i can do id:self
            ForEach(colors, id: \.self) { color in
                Text(color.description.capitalized)
                    .frame(width: 100, height: 100)
                    .background(color)
                    .foregroundColor(.white)
                
            Divider()
                    .padding(.horizontal, 12)
                
//Text(color.description.capitalized) is creating a SwiftUI Text view that displays the description of a color in capitalized form. Let's break down what each part does:
              
//            color: This is a SwiftUI Color object, which represents a color. color is from our arrayi.e., .red, .green, .blue

//            color.description: The description property of a Color object returns a textual description of the color. For example, it might return "Color(red: 1.0, green: 0.0, blue: 0.0, opacity: 1.0)" for the color red.
//
//            .capitalized: This is a Swift String method that capitalizes the first character of each word in a string. For example, if the description is "red," .capitalized will turn it into "Red."
//
//            So, Text(color.description.capitalized) takes the description of a color, capitalizes it, and creates a SwiftUI Text view that displays the capitalized color name. This is often used for user-friendly display of colors in an app's user interface.
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
