//
//  OrderListView.swift
//  Coffee
//
//  Created by Kurt McMahon on 11/16/23.
//

import SwiftUI

struct OrderListView: View {
    
    let orders: [OrderViewModel]
    
    var body: some View {
        List {
            ForEach(orders) { order in
                HStack {
                    Image(order.coffeeName)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .cornerRadius(16)
                    
                    VStack {
                        Text(order.name)
                            .font(.title)
                            .padding([.leading, .bottom], 10)
                        HStack {
                            Spacer()
                            Text(order.coffeeName)
                                .padding(6)
                                .background(.gray)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                            
                            Text(order.size)
                                .padding(6)
                                .background(.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                            Spacer()
                        }
                    }
                }
            }
        }
    }
}

struct OrderListView_Previews: PreviewProvider {
    
    static let orders = [OrderViewModel(order: Order(name: "Mary", coffeeName: "Regular", size: "Medium", total: 1.5))]
    static var previews: some View {
        OrderListView(orders: orders)
    }
}
