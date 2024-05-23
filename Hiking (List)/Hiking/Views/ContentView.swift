//
//  ContentView.swift
//  Hiking
//
//  Created by Kurt McMahon on 3/9/23.
//

import SwiftUI

struct ContentView: View {
    
    let hikes = Hike.all()
    
    var body: some View {
        NavigationStack {
            List(hikes, id: \.name) { hike in
//                NavigationLink(destination: HikeDetail(hike: hike)){
                //   destination: HikeCell(hike: hike)
//                     Text(hike.name)
                    HikeCell(hike: hike)
                //}
            }
            .listStyle(.plain)
            .navigationTitle("Hikes")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
