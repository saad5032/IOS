//
//  ContentView.swift
//  More Controls
//
//  Created by Kurt McMahon on 2/22/22.
//

import SwiftUI


struct ContentView: View {
    
    @State private var textIsRed = fals
    @State private var total = 0
    @State private var celsius = 0.0
    @State private var taskComplete = false
    @State private var progress = 0.0
    
    var body: some View {
        VStack(spacing: 20) {
            
            Toggle("Make Text Red", isOn: $textIsRed)
                .padding(.horizontal)
            
            Text("Some Text")
                .foregroundColor(textIsRed ? .red : .black)
                .bold()
            
            Stepper("Change Total", value: $total, in: 0...10, step: 1)
                .padding(.horizontal)
            
            Text("Total = \(total)")
            
            // you can use step parameter as well
            Slider(value: $celsius, in: 0.0...100.0,step : 5, minimumValueLabel: Text("0.0"), maximumValueLabel: Text("100.0"),
                // slider does not display its label.
                label: {
                Text("Temperature Conversion")}
            )
                .padding(.horizontal)
            
            Text("\(celsius, specifier: "%.1f") Celsius is \(celsius * 9.0 / 5.0 + 32.0, specifier: "%.1f") Fahrenheit")
            
            Group {
                // ProgressView for indeterminate progress
                if !taskComplete {
                    ProgressView("We're working on it")
                } else {
                    Text("All done!")
                }
                
                if !taskComplete {
                    Button("Complete Task") {
                        taskComplete = true
                    }
                } else {
                    Button("Restart Task") {
                        taskComplete = false
                    }
                }
            }
            
            Group {
                // ProgressView for determinate progress
                ProgressView("Progress", value: progress)
                    .padding()
                
                HStack {
                    Spacer()

                    Button(action: {
                        progress += 0.1
                    }) {
                        Text("Add progress")
                            .bold()
                            .padding(12)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                    }
                    
                    Spacer()

                    Button(action: {
                        progress = 0.0
                    }) {
                        Text("Reset")
                            .bold()
                            .padding(12)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                    }

                    
                    Spacer()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
