//
//  ContentView.swift
//  Coffee
//
//  Created by Kurt McMahon on 11/9/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var orderListVM = OrderListViewModel()
    
    @State private var showModal = false
    
    var body: some View {
        NavigationStack {
            OrderListView(orders: orderListVM.orders)
                .navigationTitle("Orders")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            showModal = true
                        }, label: {
                            Image(systemName: "plus")
                        })
                    }
                }
                .sheet(isPresented: $showModal, onDismiss: {
                    Task(priority: .high) {
                        await reloadOrders()
                    }
                }, content: {
                    AddCoffeeOrderView(isPresented: $showModal)
                })
        }
        .task(priority: .high) {
            await reloadOrders()
        }
    }
                   
    func reloadOrders() async {
        await orderListVM.fetchOrders()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
