//
//  Weather.swift
//  Weather
//
//  Created by Kurt McMahon on 10/19/23.
//

import Foundation

struct WeatherResponse: Decodable {
    var main: Weather
}

struct Weather: Decodable {
    var temp: Double?
    var humidity: Double?
}
