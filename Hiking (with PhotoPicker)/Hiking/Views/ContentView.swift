//
//  ContentView.swift
//  Hiking
//
//  Created by Kurt McMahon on 3/9/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var hikes = Hike.all()
    // initially the showAddHike functionality is not displayed. To display it we make it true in + buttion
    @State private var showAddHike = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(hikes, id: \.name) { hike in
                    NavigationLink(destination: HikeDetail(hike: hike)) {
                        HikeCell(hike: hike)
                    }
                }
                .onDelete(perform: deleteHike)
                // .onDelete { deleteHike(at: $0) }
                .onMove(perform: moveHike)
                //.onMove { moveHike(from: $0, to: $1) }
            }
            .listStyle(.plain)
            .navigationTitle("Hikes")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showAddHike = true
                        // here we need to code this showaddhike to do so we use sheet method
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
            }
        }
        
        //Use this method when you want to present a modal view to the user when a Boolean value you provide is true. The sheet method gets connected to the file AddHikeView as we defined the binding variable there with isPresented true. also provided hikes binding variable.
        .sheet(isPresented: $showAddHike) {
            AddHikeView(isPresented: $showAddHike, hikes: $hikes)
            // we need to pass the array hikes of our orginal struct in which we add new hikes
        }
    }
    
    func deleteHike(at offsets: IndexSet) {
        hikes.remove(atOffsets: offsets)
    }
    
    func moveHike(from source: IndexSet, to destination: Int) {
        hikes.move(fromOffsets: source, toOffset: destination)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
