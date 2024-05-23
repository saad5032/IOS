//
//  Custody.swift
//  A6
//
//  Created by Saaduddin Syed on 12/1/23.
//

import SwiftUI

struct Custody: View {

        @Environment(\.managedObjectContext) private var dbContext
        @FetchRequest(sortDescriptors: [SortDescriptor(\Item.name, order: .forward)],  predicate: nil, animation: .default) private var selectedItems: FetchedResults<Item>
    
    var CustodyCriminals : [Item] {
        return selectedItems.filter { $0.inCustody == true }
    }


    var body: some View {
        NavigationStack {
            List {
                ForEach(CustodyCriminals) { Item in
                    NavigationLink(destination: FugitiveDetailView(item: Item)) {
                        CellView(item:Item)
                    }

                }
                .onDelete(perform: { indexes in
                    Task(priority: .high) {
                        await deleteCriminal(indexes: indexes)
                    }
                })
            }
            .listStyle(.plain)
            .navigationTitle("In Custody")
            .toolbar {
                EditButton()
            }

        }
 
    }
    
    func deleteCriminal(indexes: IndexSet) async {
        await dbContext.perform {
            for index in indexes {
                dbContext.delete(CustodyCriminals[index])
            }
            
            do {
                try dbContext.save()
            } catch {
                print(error)
            }
        }
    }
}

struct Custody_Previews: PreviewProvider {
    static var previews: some View {
       Custody()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
