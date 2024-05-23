//
//  ContentView.swift
//  A6
//
//  Created by Saaduddin Syed on 11/28/23.
//

import SwiftUI
import CoreData

struct ContentView: View {

    var body: some View {
        
            TabView {
                Fugitives()
                    .tabItem {
                        Image("running-man")
                            .renderingMode(.template)
                            .foregroundColor(.gray)
                        Text("Fugitives")

                    }

                Custody()
                    .tabItem {
                        Image("handcuffs")
                            .renderingMode(.template)
                            .foregroundColor(.gray)
                        Text("in Custody")
                    }
                }
               
    }//body
}// struct

   
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
