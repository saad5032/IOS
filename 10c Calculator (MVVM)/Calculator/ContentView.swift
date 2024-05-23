//
//  ContentView.swift
//  Calculator
//
//  Created by Kurt McMahon on 2/16/22.
//

import SwiftUI

struct ContentView: View {
    
    // The @stateobject is an object of view model class. Thats how we use property wrappers.
    @StateObject private var viewModel = CalculatorViewModel()
    
    var body: some View {
        ZStack {
            
            Color(.gray)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("Calculator")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                TextField("Enter first number", text:
                            
            // I can simply use the properties like firstnumberTest of view model class as shown below.
                    $viewModel.firstNumberText)
                
                    .keyboardType(.numbersAndPunctuation)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)

                TextField("Enter second number", text:
                    $viewModel.secondNumberText)
                    .keyboardType(.numbersAndPunctuation)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)

                HStack(spacing: 8) {
                    
                    Button(action: {
                // I can also use functions like compute of viewmodel class apart from other defined variables.
                        viewModel.compute(operation: .add)
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
                        viewModel.compute(operation: .subtract)
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
                        viewModel.compute(operation: .multiply)
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
                        viewModel.compute(operation: .divide)
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
                        viewModel.firstNumberText = ""
                        viewModel.secondNumberText = ""
                        viewModel.resultText = "0.00"
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
                    Text(viewModel.resultText)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding()
                }
                
                Spacer()
            }
        }
        // error msg and show alert variables are defined in compute function of view model and thus needed to use this alert function this way. Otherwise if those variables were not part of compute function, then we could have defined the variabkes in content view itself and made the alert function completelty dependent to this page only.
        
        .alert(isPresented: $viewModel.showAlert) {
            Alert(
                title: Text("Error"),
                message: Text(viewModel.errorMessage)
            )
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
