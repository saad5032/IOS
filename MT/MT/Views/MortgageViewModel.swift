//
//  Mortgage.swift
//  MT
//
//  Created by Saaduddin Syed on 10/29/23.
//

import Foundation
// A ViewModel is normally an instance of a class that conforms to the ObservableObject protocol."
// View model of this project calculator is an instance of this class CalculatorViewModel confiming to protocol ObservableObject
class MortgageViewModel: ObservableObject {
   
   // Ant thing marked with @publiished is under complete obesrvation, so if changes are made to this below variables they are also upadated in this page i.e.,in viewmodel.
   
   // the properties marked with @Published are under observation and that changes to these properties will trigger updates in the view model and, subsequently, in any SwiftUI views that are bound to this ViewModel.
   
    @Published var Principal = ""
    @Published var interest : Double = 4.50
    @Published var LoanLife : Double = 15
    @Published var MonthlyPayment : Double = 0.00
    @Published var errorMessage = ""
    @Published var showAlert = false
    
   /*
    The formula to compute the monthly payment is: MonthlyPayment=(PxRx(1.0+R)N)/((1.0+R)N -1.0)
    where
    • P = the principal (i.e., the initial loan amount entered by the user)
    • R = the monthly interest rate = annual interest rate entered by the user / 100.0 / 12.0
    • N = total number of monthly payments over the lifetime of the loan = loan lifetime in years x
    12.0
    */
  
    func Mortgage() {
        guard let P = Double(Principal) else {
           errorMessage = "Please enter a valid value for the amount"
           showAlert = true
           return
        }
        let R = interest/100.0/12.0
        let N = LoanLife*12.0
      
        var result : Double
        result = (P*R*pow((1.0+R),N))/(pow((1.0+R),N)-1.0)

        MonthlyPayment = result
        
   }
}
