//
//  ContentView.swift
//  Hiking
//
//  Created by Kurt McMahon on 3/3/22.
//

import SwiftUI


struct ContentView: View {
    
    @State private var hikes = Hike.all()
    @State private var showAddHike = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach (hikes, id: \.name) { hike in
                    NavigationLink(destination: HikeDetail(hike: hike)) {
                        HikeCell(hike: hike)
                    }
                }
                //.onDelete { deleteHike(at: $0) }
                .onDelete(perform: deleteHike)
                //.onMove { moveHike(from: $0, to: $1) }
                .onMove(perform: moveHike)
            }
            .listStyle(.plain)
            .navigationTitle("Hikes")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showAddHike = true
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
            }
        }
        .sheet(isPresented: $showAddHike) {
            AddHikeView(isPresented: $showAddHike, hikes: $hikes)
        }
        .onAppear {
            print("ContentView appeared")
        }
        .onDisappear {
            print("ContentView disappeared")
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
