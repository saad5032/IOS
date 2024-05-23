//
//  CoffeeCellView.swift
//  Coffee
//
//  Created by Kurt McMahon on 11/9/23.
//

import SwiftUI

struct CoffeeCellView: View {
    
    var coffee: CoffeeViewModel
    @Binding var selection: String
    
    var body: some View {
        HStack {
            Image(coffee.imageURL)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(16)
            Text(coffee.name)
                .font(.title)
            Spacer()
            if selection == coffee.name {
                Image(systemName: "checkmark")
            }
        }
        .onTapGesture {
            selection = coffee.name
        }
    }
}

struct CoffeeCellView_Previews: PreviewProvider {
    
    @State static var selection = "Regular"
    
    static var previews: some View {
        CoffeeCellView(coffee: CoffeeViewModel(coffee: Coffee(name: "Regular", imageURL: "Regular", price: 1.5)), selection: $selection)
    }
}
