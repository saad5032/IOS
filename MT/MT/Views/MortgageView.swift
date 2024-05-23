//
//  MortgageView.swift
//  MT
//
//  Created by Saaduddin Syed on 10/30/23.
//

import SwiftUI

struct CalculateButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(8)
            .background(Color(.black))
            .foregroundColor(.white)
            .clipShape(Capsule())
    }
}

// Using NumberFormatter to have currency.
var format : NumberFormatter {
    let f = NumberFormatter()
    f.numberStyle = .currency
    // I used numberStyle property of class NumberFormatter() via f and also used its build in value .currency
    return f
}

struct MortgageView: View {
    @StateObject private var Mortgageview = MortgageViewModel()
    var body: some View {
 

            VStack(spacing: 20){
                Text("Loan Calculator")
                    .font(.title)
                    .bold()
                    .padding()
                
                TextField("Enter principal", text: $Mortgageview.Principal)
                    .keyboardType(.numbersAndPunctuation)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
                
                Stepper("Interest", value: $Mortgageview.interest, in: 0.01...20.00, step: 0.01)
                    .padding(.horizontal)
                    .bold()
                
                
                HStack{
                    Text("Annual Rate:")
                        .bold()
                    Spacer()
                    Text(String(format:"%.2f%%", Mortgageview.interest))
                }    .padding(.horizontal)
                
                HStack{
                    Text("Number of Years:")
                        .bold()
                    Spacer()
                    Text(String(format:"%.0f years", Mortgageview.LoanLife))
                }    .padding(.horizontal)
                
    
                Slider(value: $Mortgageview.LoanLife, in: 10...30,step : 5,
                       minimumValueLabel: Text("10"), maximumValueLabel: Text("30"),
                    // slider does not display its label.
                    label: {
                    Text("Loan life time")}
                )
                    .padding(.horizontal)
                
                
                
                Button(action: {
                    Mortgageview.Mortgage()
                    }, label: {
                    Text("Calculate")
                        .font(.title3)
                        .fontWeight(.bold)
                    })
   
                .buttonStyle(CalculateButton())
                .padding()
                
             
                HStack{
                    Text("Monthly Payment:")
                        .bold()
                    Spacer()
                    Text("\(NSNumber(value: Mortgageview.MonthlyPayment), formatter:format)")
                }    .padding(.horizontal)
                
       
                Spacer()
              
                
            } // VStack

        .padding()
    }
}

struct MortgageView_Previews: PreviewProvider {
    static var previews: some View {
        MortgageView()
    }
}
