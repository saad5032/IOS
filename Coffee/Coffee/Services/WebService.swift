//
//  WebService.swift
//  Coffee
//
//  Created by Kurt McMahon on 11/9/23.
//

import Foundation

class WebService {
    
    func fetchOrders(url: URL?) async throws -> [Order] {
        guard let url = url else {
            return []
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let orders = try? JSONDecoder().decode([Order].self, from: data)

        return orders ?? []
    }
    
    func createCoffeeOrder(url: URL?, order: Order) async throws -> OrderResponse? {
        guard let url = url else {
            return nil
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(order)
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        let orderResponse = try? JSONDecoder().decode(OrderResponse.self, from: data)
        
        return orderResponse
    }
}
