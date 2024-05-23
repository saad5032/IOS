//
//  ContentView.swift
//  Pickers
//
//  Created by Kurt McMahon on 2/22/22.
//

import SwiftUI

struct ContentView: View {
    
    @SceneStorage("selectedTab") var selection = 0
    
    var body: some View {
        // This selection has @SceneStrorage property declared. When i ropens my app i will get the tab that i selected before closing it. So @scenestorage var remenebers the tag(no)
        TabView(selection: $selection) {
            SegmentedControlView().tag(0)
                .tabItem {
                    Label("Ice Cream", image: "Cone")
                }
            
            SinglePickerView().tag(1)
                .tabItem {
                    Label("Star Wars", image: "R2-D2")
                }

            DoublePickerView().tag(2)
                .tabItem {
                    Label("Lunch", image: "Sandwich")
                }

            DatePickerView().tag(3)
                .tabItem {
                    Label("Date", image: "Calendar")
                }

            DependentPickerView().tag(4)
                .tabItem {
                    Label("Zip Codes", image: "USA Map")
                }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
