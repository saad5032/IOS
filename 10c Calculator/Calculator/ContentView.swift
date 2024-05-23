//
//  ContentView.swift
//  Calculator
//
//  Created by Kurt McMahon on 2/16/22.
//

import SwiftUI

enum MathOperation {
    case add, subtract, multiply, divide
}

struct ContentView: View {
    
    @State private var firstNumberText = ""
    @State private var secondNumberText = ""
    @State private var resultText = "0.00"
    
    @State private var errorMessage = ""
    @State private var showAlert = false
    
    var body: some View {
        ZStack {
            
            Color(.gray)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("Calculator")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                TextField("Enter first number", text: $firstNumberText)
                    .keyboardType(.numbersAndPunctuation)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)

                TextField("Enter second number", text: $secondNumberText)
                    .keyboardType(.numbersAndPunctuation)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)

                HStack(spacing: 8) {
                    
                    Button(action: {
                        compute(operation: .add)
                    }, label: {
                        Label("Add", systemImage: "plus")
                            .font(.title)
                            .labelStyle(.iconOnly)
                    })
                    .frame(width: 50, height: 50)
                    .background(Color.black)
                    .cornerRadius(12)
                    .foregroundColor(.white)
                    
                    Button(action: {
                        compute(operation: .subtract)
                    }, label: {
                        Label("Subtract", systemImage: "minus")
                            .font(.title)
                            .labelStyle(.iconOnly)
                    })
                    .frame(width: 50, height: 50)
                    .background(Color.orange)
                    .cornerRadius(12)
                    .foregroundColor(.white)

                    Button(action: {
                        compute(operation: .multiply)
                    }, label: {
                        Label("Multiply", systemImage: "multiply")
                            .font(.title)
                            .labelStyle(.iconOnly)
                    })
                    .frame(width: 50, height: 50)
                    .background(Color.black)
                    .cornerRadius(12)
                    .foregroundColor(.white)

                    Button(action: {
                        compute(operation: .divide)
                    }, label: {
                        Label("Divide", systemImage: "divide")
                            .font(.title)
                            .labelStyle(.iconOnly)
                    })
                    .frame(width: 50, height: 50)
                    .background(Color.orange)
                    .cornerRadius(12)
                    .foregroundColor(.white)

                    Button(action: {
                        firstNumberText = ""
                        secondNumberText = ""
                        resultText = "0.00"
                    }, label: {
                        Text("C")
                            .font(.largeTitle)
                    })
                    .frame(width: 50, height: 50)
                    .background(Color.black)
                    .cornerRadius(12)
                    .foregroundColor(.white)

                }
                
                HStack {
                    Text("Result:")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding()
                    Spacer()
                    Text(resultText)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding()
                }
                
                Spacer()
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Error"),
                message: Text(errorMessage)
            )
        }
    }
    
    func compute(operation: MathOperation) {
        
        guard let firstNumber = Double(firstNumberText) else {
            errorMessage = "Please enter a valid value for the first number"
            showAlert = true
            return
        }

        guard let secondNumber = Double(secondNumberText) else {
            errorMessage = "Please enter a valid value for the second number"
            showAlert = true
            return
        }

        var result: Double
        
        switch operation {
        case .add:
            result = firstNumber + secondNumber
        case .subtract:
            result = firstNumber - secondNumber
        case .multiply:
            result = firstNumber * secondNumber
        case .divide:
            result = firstNumber / secondNumber
        }
        
        resultText = String(format:"%.2f", result)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
