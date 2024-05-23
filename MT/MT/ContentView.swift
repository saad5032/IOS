//
//  ContentView.swift
//  MT
//
//  Created by Saaduddin Syed on 10/29/23.
//

import SwiftUI


struct ContentView: View {

    var body: some View {
        TabView {
            
            // I have image Temperature and Swuift UI view for Temperature which also have model for logic part and same goes for Mortgage.
            TemperatureView()
                .tabItem {
                    Label("Temperature", image: "Temperature")
                }
            
            MortgageView()
                .tabItem {
                    Label("House",image: "House")
                }
            } // TabView
        
    }
     
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
