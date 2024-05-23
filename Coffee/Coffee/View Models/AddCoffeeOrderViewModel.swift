//
//  AddCoffeeOrderViewModel.swift
//  Coffee
//
//  Created by Kurt McMahon on 11/9/23.
//

import Foundation

@MainActor
class AddCoffeeOrderViewModel: ObservableObject {
    
    var name = ""
    @Published var size = "Medium"
    @Published var coffeeName = ""
    
    private var webService = WebService()
    
    var coffeeList: [CoffeeViewModel] {
        return Coffee.all().map(CoffeeViewModel.init)
    }
    
    var total: Double {
        return calculateTotalPrice()
    }
    
    func placeOrder() async {
        
        do {
            let order = Order(name: name, coffeeName: coffeeName, size: size, total: total)
            print(order)
            let orderResponse = try await webService.createCoffeeOrder(url: Constants.Urls.orderUrl, order: order)
            
            if let orderResponse = orderResponse, orderResponse.success {
                print("Order added")
            } else {
                print("Failed to add order")
            }
            
        } catch {
            print(error)
        }
    }
    
    private func calculateTotalPrice() -> Double {
        let coffeeVM = coffeeList.first {
            $0.name == coffeeName
        }
        
        if let coffeeVM = coffeeVM {
            return coffeeVM.price * priceForSize()
        } else {
            return 0.0
        }
    }
    
    private func priceForSize() -> Double {
        let prices = ["Small" : 2.0, "Medium" : 3.0, "Large" : 4.0]
        
        return prices[self.size]!
    }
}
