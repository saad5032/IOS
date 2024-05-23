//
//  AddCoffeeOrderView.swift
//  Coffee
//
//  Created by Kurt McMahon on 11/9/23.
//

import SwiftUI

struct AddCoffeeOrderView: View {
    
    @Binding var isPresented: Bool
    @ObservedObject private var addCoffeeOrderVM = AddCoffeeOrderViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section(header: Text("INFORMATION").font(.body)) {
                        TextField("Enter Name", text: $addCoffeeOrderVM.name)
                    }

                    Section(header: Text("SELECT COFFEE").font(.body)) {
                        ForEach(addCoffeeOrderVM.coffeeList, id:\.name) { coffee in
                            CoffeeCellView(coffee: coffee, selection: $addCoffeeOrderVM.coffeeName)
                        }
                    }
                    
                    Section(header: Text("SELECT SIZE").font(.body), footer: OrderTotalView(total: addCoffeeOrderVM.total)) {
                        Picker("", selection: $addCoffeeOrderVM.size) {
                            Text("Small").tag("Small")
                            Text("Medium").tag("Medium")
                            Text("Large").tag("Large")
                        }
                        .pickerStyle(.segmented)
                    }

                    HStack {
                        Button("Place Order") {
                            Task {
                                await addCoffeeOrderVM.placeOrder()
                            }
                            isPresented = false
                        }
                    }
                    .padding(EdgeInsets(top: 12, leading: 100, bottom: 12, trailing: 100))
                    .foregroundColor(.white)
                    .background(Color(red: 46/255, green: 204/255, blue: 113/255))
                    .cornerRadius(10)
                    
                }
            }
        }
        .navigationTitle("Add Order")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(leading: Button(action: cancelOrder) {
                Text("Cancel")
                .foregroundColor(.blue)
        })
    }
    
    func cancelOrder() {
        isPresented = false
    }
}

struct AddCoffeeOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddCoffeeOrderView(isPresented: .constant(true))
    }
}
