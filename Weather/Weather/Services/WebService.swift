//
//  WebService.swift
//  Weather
//
//  Created by Kurt McMahon on 10/19/23.
//

import Foundation

class WebService {
    func fetchWeather(for city: String) async throws -> Weather? {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&APPID=5de5edd92a8e8058cec3c2ae70192e26&units=imperial") else {
            return nil
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
        
        return weatherResponse?.main ?? nil
    }
}
