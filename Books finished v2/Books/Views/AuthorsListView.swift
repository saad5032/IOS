//
//  AuthorsListView.swift
//  Books
//
//  Created by Kurt McMahon on 11/7/23.
//

import SwiftUI

struct AuthorsListView: View {
    
    @Environment(\.managedObjectContext) private var dbContext
    @Environment(\.dismiss) var dismiss
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\Author.name, order: .forward)], predicate: nil, animation: .default) private var listOfAuthors: FetchedResults<Author>
    
    @Binding var selected: Author?

    var body: some View {
        
        NavigationStack {
            List {
                
                ForEach(listOfAuthors) { author in
                    Text(author.showName)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            selected = author
                            dismiss()
                        }
                }
                .onDelete(perform: { indexes in
                    Task(priority: .high) {
                        await deleteAuthor(indexes: indexes)
                    }
                })
            }
            .listStyle(.plain)
            .navigationTitle("Authors")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: InsertAuthorView(), label: {
                        Image(systemName: "plus")
                    })
                }

            }
        }
    }
        
    func deleteAuthor(indexes: IndexSet) async {
        await dbContext.perform {
            for index in indexes {
                dbContext.delete(listOfAuthors[index])
            }
            
            do {
                try dbContext.save()
            } catch {
                print(error)
            }
        }
    }

}

struct AuthorsListView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorsListView(selected: .constant(nil))
    }
}
