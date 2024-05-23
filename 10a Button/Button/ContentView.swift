//
//  ContentView.swift
//  Button
//
//  Created by Kurt McMahon on 2/16/22.
//

import SwiftUI

// GreenButton style - could easily be
// extracted into its own .swift file.

// here we made our own custom struct and custom styling so we can use it later for different buttons.

struct GreenButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color(red: 51/255, green: 153/255, blue: 51/255))
            .foregroundColor(.white)
            .clipShape(Capsule())
    }
}

// FancyButtonView - could easily be
// extracted into its own .swift file.

struct FancyButtonView: View {
    
    // MARK: - BODY
    // this string accepts user input.
    var buttonText: String = ""
    
    var body: some View {
        HStack(spacing: 8) {
            Text(buttonText)
                .foregroundColor(.purple)
            Image(systemName: "arrow.right.circle")
                .imageScale(.large)
                .accentColor(.purple)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .background(Capsule().strokeBorder(Color.purple, lineWidth: 1.25))
    }
}

struct ContentView: View {
    
    // MARK: - PROPERTIES
    // This property wrapper @state let me modify the value of isBlue variable. state variable are private bcoz they are generally applied to only for single view. They describe state of the current view, and they are not generally accesed in other files and if we need to acces it we can just pass it using dependency injection concept in swift.
    
    @State private var isBlue = true
    
    // MARK: - BODY
    
    var body: some View {
        VStack {
            
            // 1. Basic button.
            Button("Hello") {
                print("Hello button pressed")
            }
            .padding()
            
            // 2. Button with a boring custom label.
            Button(action: {
                print("Goodbye button pressed")
            }, label: {
                Text("Goodbye")
            })
            .padding()
            
            // 2. Button with a more interesting custom label.
            Button(action: {
                print("Calendar button pressed")
            }, label: {
                Label(title: {
                    Text("Calendar")
                }, icon: {
                    Image(systemName: "calendar.circle.fill")
                })
                .font(.largeTitle)
                .foregroundColor(.red)
            })
            .padding()

            // 4. Styled button.
            Button(action: {
                print("Stylish button pressed")
            }, label: {
                Text("I'm stylish!")
                    .font(.title2)
                    .fontWeight(.bold)
            })
            .buttonStyle(GreenButton())
            .padding()

            // 4a.
            Button(action: {
                print("I'm another stylish button")
            }, label: {
                Text("Also very stylish!")
                    .font(.title3)
                    .fontWeight(.bold)
            })
            .buttonStyle(GreenButton())
            .padding()

            // 5. Fancy button with custom view.
            Button(action: {
                print("Fancy button pressed")
            }, label: {
                FancyButtonView(buttonText: "I'm fancy!")
            })

            // 5. Fancy button with custom view.
            Button(action: {
                print("Other fancy button pressed")
            }, label: {
                FancyButtonView(buttonText: "So am I!")
            })

            // 6. Button that does something!
            Text("Text Text Text")
                .font(.title)
                .bold()
                .foregroundColor(isBlue ? .blue : .red)
            // true --> blue , false --> red
                .padding()
            
            Button(action: {
                print("Text button pressed")
                // toggle changes the color, as isBlue become true blue color is applied  and if false red color.
                isBlue.toggle()
            }, label: {
                Text("Change Color")
                .font(.title3)
                .bold()
                .foregroundColor(.white)
                .padding(12)
                    .background(Capsule()  .foregroundColor(.purple))
            })
        }
    }
}

// MARK: - PREVIEWS

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
