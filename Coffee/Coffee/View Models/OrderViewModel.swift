//
//  OrderViewModel.swift
//  Coffee
//
//  Created by Kurt McMahon on 11/16/23.
//

import Foundation

class OrderViewModel: Identifiable {
    let id = UUID()
    
    var order: Order
    
    var formatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }
    
    init(order: Order) {
        self.order = order
    }
    
    var name: String {
        return order.name
    }
    
    var size: String {
        return order.size
    }
    
    var coffeeName: String {
        return order.coffeeName
    }
    
    var total: String {
        return formatter.string(from: NSNumber(value: order.total))!
    }
}
