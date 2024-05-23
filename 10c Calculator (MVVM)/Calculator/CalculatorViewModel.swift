//
//  CalculatorViewModel.swift
//  Calculator
//
//  Created by Kurt McMahon on 2/22/22.
//

import Foundation
 // A ViewModel is normally an instance of a class that conforms to the ObservableObject protocol."
// View model of this project calculator is an instance of this class CalculatorViewModel confiming to protocol ObservableObject
class CalculatorViewModel: ObservableObject {
    
    // Ant thing marked with @publiished is under complete obesrvation, so if changes are made to this below variables they are also upadated in this page i.e.,in viewmodel.
    
    // the properties marked with @Published are under observation and that changes to these properties will trigger updates in the view model and, subsequently, in any SwiftUI views that are bound to this ViewModel.
    
    @Published var firstNumberText = ""
    @Published var secondNumberText = ""
    @Published var resultText = "0.00"
    
    @Published var errorMessage = ""
    @Published var showAlert = false
    
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
