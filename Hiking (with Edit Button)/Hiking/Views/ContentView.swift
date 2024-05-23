//
//  ContentView.swift
//  Hiking
//
//  Created by Kurt McMahon on 3/9/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var hikes = Hike.all()  // I ll use this hikes in list to get all the data in list.
    
    var body: some View {
        NavigationStack {
            List {
                // I am iterating through all the items in model extension data (hikes) with the word hike using list.
                ForEach(hikes, id: \.name) { hike in
        
                    // Every hike(ele) in list has a link now which via they can now view the hike(ele) in the way they want as per HikeDetail file. If you dont provide this below line then you wont navigate to other page.
                    NavigationLink(destination: HikeDetail(hike: hike))
                    {
                    HikeCell(hike: hike) // this line bascially displays all the iterated elements (hike) in homepage body of content view, the the way we want elements to look like, we are using HikeCell.
                    }
                    
                }
                // this way you can delete the view but in UI kit inorder to delete the view you also have to delete the item backing the view in datastructure model.
                .onDelete(perform: deleteHike)
                // .onDelete { deleteHike(at: $0) }
                .onMove(perform: moveHike)
                //.onMove { moveHike(from: $0, to: $1) }
            }
            .listStyle(.plain)
            .navigationTitle("Hikes")
            .toolbar {
                EditButton()
            }
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
