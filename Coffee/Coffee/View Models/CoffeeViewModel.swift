//
//  CoffeeViewModel.swift
//  Coffee
//
//  Created by Kurt McMahon on 11/9/23.
//

import Foundation

struct CoffeeViewModel {
    var coffee: Coffee
    
    var name: String {
        return coffee.name
    }
    
    var imageURL: String {
        return coffee.imageURL
    }
    
    var price: Double {
        return coffee.price
    }
}
