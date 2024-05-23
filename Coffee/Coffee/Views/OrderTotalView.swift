//
//  OrderTotalView.swift
//  Coffee
//
//  Created by Kurt McMahon on 11/16/23.
//

import SwiftUI

struct OrderTotalView: View {
    
    let total: Double
    
    var formatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }
    
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            Text("\(NSNumber(value: total), formatter: formatter)")
                .font(.title)
                .foregroundColor(.green)
            Spacer()
        }
    }
}

struct OrderTotalView_Previews: PreviewProvider {
    static var previews: some View {
        OrderTotalView(total: 3.75)
    }
}
