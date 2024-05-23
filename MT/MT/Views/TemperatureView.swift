//
//  Temperature.swift
//  MT
//
//  Created by Saaduddin Syed on 10/30/23.
//

import SwiftUI

struct TemperatureView: View {
    
    let pickerData = [Array(-129...134), Array(-90...57)]
    
    @StateObject private var Temp = TemperatureViewModel()
    

    var body: some View {
        VStack {
            Text("Temperature Conversion")
                .font(.title2)
                .bold()
                .multilineTextAlignment(.center)
                .padding()
            
            
            // Picker swift ui method, and below here its selecting either 0 or 1 based on two texts views, the selected int is stored in selectedSetting.
            
            Picker("Setting", selection: $Temp.selectedSetting) {
                Text("\(Temp.F) \(Temp.Arrow) \(Temp.C)").tag(0)
                Text("\(Temp.C) \(Temp.Arrow) \(Temp.F)").tag(1)
            }
            
            // I am giving segmented control for changing between two conversions.
            .pickerStyle(.segmented)
            .padding(.horizontal)
            
            
            // pickerData is 2d array, if selectedSetting is 0 then array 1 (Fahreheit numbers )is selected else array 2 (Celcius numbers).
            
            Picker("Temperature", selection: $Temp.selected) {
                ForEach(pickerData[Temp.selectedSetting], id: \.self) {
                    if Temp.selectedSetting == 0 {
                        Text("\($0) \(Temp.F)")
                    } else {
                        Text("\($0) \(Temp.C)" )
                    }
                    
                }
            }
            .pickerStyle(.wheel)
            .onChange(of: Temp.selected) {
                _ in Temp.Temperature()
            }
            
            Text(Temp.result)
                    .bold()
       Spacer()

            
            
        } // vstack
    }// body
}// struct Temperature



struct Temperature_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureView()
    }
}
