//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Kurt McMahon on 10/24/23.
//

import Foundation

@MainActor
class WeatherViewModel: ObservableObject {
    
    private var webService = WebService()
    
    @Published var weather = Weather()
    @Published var cityName = ""
    
    var temperature: String {
        if let temp = weather.temp {
            return String(format: "%.0f\u{2109}", temp)
        } else {
            return ""
        }
    }
    
    var humidity: String {
        if let humidity = weather.humidity {
            return String(format: "%.0f%%", humidity)
        } else {
            return ""
        }
    }
    
    // the below function takes care of any spaces in city name
    func search() async {
        if let city = cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            await fetchWeather(for: city)
        }
    }
    
    private func fetchWeather(for city: String) async {
        do {
            weather = try await webService.fetchWeather(for: city) ?? Weather()
        } catch {
            print(error)
        }
    }
}
