//
//  ContentView.swift
//  TextField
//
//  Created by Kurt McMahon on 2/16/22.
//

import SwiftUI

class NumbersOnly: ObservableObject {
    @Published var value = "" {
        didSet {
            let filtered = value.filter { $0.isNumber }
            
            if value != filtered {
                value = filtered
            }
        }
    }
}

struct ContentView: View {
    
    // MARK: - Properties
    @State private var name = ""
    @State private var total = 0.0
    @StateObject var input = NumbersOnly()
    
    var inputFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }

    var outputFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }

    // MARK: - Body
    
    var body: some View {
        VStack {
            Spacer()
            // $name a binding var binds with sate variable name
            TextField("Enter your name", text: $name)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            Text(name) // whatever i write in the input field will be displayed bcoz of this line
                .padding()

            TextField("Enter total bill", value: $total, formatter: inputFormatter)
                .keyboardType(.decimalPad)
                .padding()
            
            Text("The amount is \(NSNumber(value: total), formatter: outputFormatter)")
                .padding()

            TextField("Enter a number", text: $input.value)
                .keyboardType(.numbersAndPunctuation)
                .padding()
            
            Text("The amount is \( input.value)")
                .textFieldStyle(.roundedBorder)
                .padding()

            Spacer()
        }
        // The below code tells keyboard, im done typing the kwyboard can go away. Thus by tapping in secreen , the focus shifts from keyboard and goes to screen. The first responder (keyboard) resigns.
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
        }
    }
}

// MARK: - Previews

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
