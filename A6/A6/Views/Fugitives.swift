//
//  Fugitives.swift
//  A6
//
//  Created by Saaduddin Syed on 11/29/23.
//

import SwiftUI

struct Fugitives: View {
    
        @Environment(\.managedObjectContext) private var dbContext
    
        @FetchRequest(sortDescriptors: [SortDescriptor(\Item.name, order: .forward)], predicate: nil, animation: .default) private var listOfCriminals: FetchedResults<Item>
    
    var FugitiveCriminals : [Item] {
        return listOfCriminals.filter { $0.inCustody == false }
    }

    var body: some View {
        VStack{
            NavigationStack {
                List {
                    ForEach(FugitiveCriminals.dropFirst()) { Item in
                        NavigationLink(destination: FugitiveDetailView(item: Item)
                                ) {
                            CellView(item:Item)
                        }
                        
                    }
                }
                .listStyle(.plain)
                .navigationTitle("Fugitives")
            
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination : InsertCriminal().navigationBarBackButtonHidden(true),label: {
                            Image(systemName: "plus")
                        }
                        )
                    }
                }
                
            }
      
            
        }
           
        }
        

             
    
}

struct Fugitives_Previews: PreviewProvider {
    static var previews: some View {
        Fugitives()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
