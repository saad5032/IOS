//
//  ContentView.swift
//  DogAgeConverter
//
//  Created by Saaduddin Syed on 10/17/23.
//

import SwiftUI
import Foundation

enum MathOperation {
    case age
}

struct HumanAgeButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(8)
            .background(Color(.white))
            .foregroundColor(.black)
            .clipShape(Capsule())
    }
}


struct ContentView: View {
    @State private var DogAge = ""
    @State private var ResultApp = ""
    @State private var errorMsg = ""
    @State private var showAlert = false

    
    let gradient = Gradient(colors: [
        .init(red:  0.1255, green: 0.2275, blue: 0.2627),
        .init(red: 0.1255 , green: 0.2275, blue: 0.2627),
        .init(red: 0.1725, green: 0.3255, blue: 0.3922)
    ])
    
    var body: some View {
        ZStack{
            
            // I gave the shade from leading to trailing.The shades are in gradient constant above.
            LinearGradient(gradient: gradient, startPoint: .leading, endPoint: .trailing)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
            // The question on top is in custom made autumn style family which i preferred and downloaded from fontspace.
                Text("How old is your dog?")
                    .font(.custom("AutumnFlowersRegular", size: 40))
                    .bold()
                    .padding(30)
                    .foregroundColor(.white)
                
            // this is the tab where you enter dog age and the binding variable DogAge will store whatever input the user has given.
                TextField("Enter your dog's age", text: $DogAge)
                    .keyboardType(.numbersAndPunctuation)
                    .textFieldStyle(.roundedBorder)
                    .padding()
            
                // Making image in proper circle shape
                Image("Dog")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 200, height: 200)
                    .padding(60)
    
                // If button pressed the below function will execute.
                Button(action: {
                    calculate(operation: .age)
                    }, label: {
                    Text("Human Age")
                        .font(.title3)
                        .fontWeight(.bold)
                    })
   
                .buttonStyle(HumanAgeButton())
                .padding()
            
                // The output of the action will be displayed horizontally.
                HStack{
                    Text(ResultApp)
                        .foregroundColor(.white)
                }
            Spacer()
            }
            
        }
        // The built in alert method shows if Dog age is not provided or written in alphabet way. this is done via guard inside calculate function.
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Error"),
                message: Text(errorMsg)
            )
        }
        
        .onAppear {
            
            // I wanted to know the exact font family name autumnflowers which I added in bundle.
            
            for fontFamily in UIFont.familyNames {
                for fontName in UIFont.fontNames(forFamilyName: fontFamily) {
                    print("\(fontName)")
                }
            }
            
        }
        
      
      
    }
    
    func calculate(operation: MathOperation) {
        // this operation will be the button action
        // As i press human age button, the fromula works and converts dog age to human years.
        guard let dogAge = Double(DogAge) else {
            errorMsg = "Please enter a valid age for your dog"
            showAlert = true
            return
        }
        var result: Double
        //16 times the natural log of the dog’s age, plus 31
        result = 16 * log(dogAge) + 31
        
        let intResult = String(format: "%.0f", result)
        
        
        ResultApp = "In human years, your dog is "+intResult+"!"
        
    }
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
