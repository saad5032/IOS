//
//  ContentView.swift
//  Weather
//
//  Created by Kurt McMahon on 10/19/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var weatherVM = WeatherViewModel()
    
    var body: some View {
        VStack {
            Text("Today's Weather")
                .font(.largeTitle)
                .bold()
                .padding()
            
            TextField("Enter city name", text: $weatherVM.cityName)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Button("Get the Weather") {
                Task(priority: .userInitiated) {
                    await weatherVM.search()
                }
            }
            
            Text(weatherVM.temperature)
                .font(.custom("Arial", size: 50))
                .padding()
            
            Text(weatherVM.humidity)
                .font(.custom("Arial", size: 50))
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .padding()

       
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
