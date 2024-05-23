//
//  TemperatureViewModel.swift
//  MT
//
//  Created by Saaduddin Syed on 10/30/23.
//

import Foundation
class TemperatureViewModel: ObservableObject {
    

  
    @Published var selectedSetting = 0
    @Published var selected = 31
    @Published var showAlert = false
    @Published var F = "\u{2109}"
    @Published var Arrow = "\u{2B62}"
    @Published var C = "\u{2103}"
    
    @Published var result : String = ""
  

    // Fahrenheit to celcius Formula : (32°F − 32) × 5/9 = 0°C
    // Celcius to Fahrenheit Formula : (0°C × 9/5) + 32 = 32°F
    func Temperature() {
        if selectedSetting == 0 {
            let Celcius = (Double(selected)-32)*(5/9)
            result = String(format: "%.2f", Celcius)+C
            
        } else {
            let Fahrenheit = (Double(selected)*9/5)+32
            result = String(format: "%.2f", Fahrenheit)+F
        }
        
   }
}
