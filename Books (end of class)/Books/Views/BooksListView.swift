//
//  BooksListView.swift
//  Books
//
//  Created by Kurt McMahon on 11/2/23.
//

import SwiftUI

struct BooksListView: View {
    
    @Environment(\.managedObjectContext) private var dbContext
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\Book.title, order: .forward)], predicate: nil, animation: .default) private var listOfBooks: FetchedResults<Book>
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(listOfBooks) { book in
                    BookRow(book: book)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Books")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: InsertBookView(), label: {
                        Image(systemName: "plus")
                    })
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BooksListView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
