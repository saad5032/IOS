//
//  ContentView.swift
//  DisclosureGroup
//
//  Created by Kurt McMahon on 2/16/22.
//

import SwiftUI

struct ContentView: View {
    
    let nutrients = ["Energy", "Sugar", "Fat", "Protein", "Vitamins", "Minerals"]
    let nutritionData = ["240 kJ (57 kcal)","9.96 g","0.33 g","0.74 g","A, B1, B2, B3, B5, B6, B9, C, E, K","Calcium, Iron, Magnasium, Manganese, Phosphorus, Sodium, Zinc"]

    var body: some View {
        GroupBox() {
            DisclosureGroup("Nutritional value per 100g") {
                ForEach(0..<nutrients.count, id: \.self) { item in
                    Divider().padding(.vertical, 2)
                    
                    HStack {
                        Group {
                            Image(systemName: "info.circle")
                            Text(nutrients[item])
                        }
                        .foregroundColor(.blue)
                        .font(Font.system(.subheadline).bold())
                        
                        Spacer(minLength: 100)
                        
                        Text(nutritionData[item])
                            .multilineTextAlignment(.trailing)
                    
                    } //: HSTACK
                }
            }
        } //: BOX
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
