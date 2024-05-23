//
//  ContentView.swift
//  Pickers
//
//  Created by Kurt McMahon on 2/22/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
// Tab view is a collection of views that i want to display as tab.
        TabView {
            
            SegmentedControlView()
            // tab view is in content view. I turn the view to tab item which takes label that puts image on top and text below.
                .tabItem {
                    Label("Ice Cream", image: "Cone")
                }
            
            SinglePickerView()
                .tabItem {
                    Label("Star Wars", image: "R2-D2")
                }

            DoublePickerView()
                .tabItem {
                    Label("Lunch", image: "Sandwich")
                }

            DatePickerView()
                .tabItem {
                    Label("Date", image: "Calendar")
                }
                .labelsHidden()

            DependentPickerView()
                .tabItem {
                    Label("Zip Codes", image: "USA Map")
                }

            MultiDatePickerView()
                .tabItem {
                    Label("Travel", image: "Airplane")
                }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
