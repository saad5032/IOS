//
//  OrderListViewModel.swift
//  Coffee
//
//  Created by Kurt McMahon on 11/16/23.
//

import Foundation

@MainActor
class OrderListViewModel: ObservableObject {
    
    @Published var orders = [OrderViewModel]()
    
    func fetchOrders() async {
        do {
            let orders = try await WebService().fetchOrders(url: Constants.Urls.orderUrl)
            self.orders = orders.map(OrderViewModel.init)
        } catch {
            print(error)
        }
    }
}
