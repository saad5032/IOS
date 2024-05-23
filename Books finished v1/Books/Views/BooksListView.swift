//
//  BooksListView.swift
//  Books
//
//  Created by Kurt McMahon on 11/2/23.
//

import SwiftUI
import CoreData

struct BooksListView: View {
    
    @Environment(\.managedObjectContext) private var dbContext
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\Book.title, order: .forward)], predicate: nil, animation: .default) private var listOfBooks: FetchedResults<Book>
    
    @State private var totalBooks = 0
    @State private var search = ""
    
    var body: some View {
        NavigationStack {
            List {
                
                HStack {
                    Text("Total Books")
                    Spacer()
                    Text("\(totalBooks)")
                }
                .foregroundColor(.green)
                
                ForEach(listOfBooks) { book in
                    BookRow(book: book)
                }
                .onDelete(perform: { indexes in
                    Task(priority: .high) {
                        await deleteBook(indexes: indexes)
                    }
                })
            }
            .listStyle(.plain)
            .navigationTitle("Books")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Menu("Sort") {
                        Button("Sort by Title") {
                            let sort = SortDescriptor(\Book.title, order: .forward)
                            listOfBooks.sortDescriptors = [sort]
                        }
                        
                        Button("Sort by Author") {
                            let sort1 = SortDescriptor(\Book.author, order: .forward)
                            let sort2 = SortDescriptor(\Book.year, order: .reverse)

                            listOfBooks.sortDescriptors = [sort1, sort2]
                        }
                        
                        Button("Sort by Year") {
                            let sort1 = SortDescriptor(\Book.year, order: .reverse)
                            let sort2 = SortDescriptor(\Book.author, order: .forward)

                            listOfBooks.sortDescriptors = [sort1, sort2]

                        }
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: InsertBookView(), label: {
                        Image(systemName: "plus")
                    })
                }
            }
            .searchable(text: $search, prompt: Text("Insert title"))
            .onChange(of: search) { value in
                
                if !search.isEmpty {
                    listOfBooks.nsPredicate = NSPredicate(format: "title BEGINSWITH[c] %@", value)
                } else {
                    listOfBooks.nsPredicate = nil
                }
                
                /*
                if value.count == 4 {
                    if let year = Int32(value) {
                        listOfBooks.nsPredicate = NSPredicate(format: "year >= %@", NSNumber(value: year))
                    } else {
                        listOfBooks.nsPredicate = nil
                    }
                } else {
                    listOfBooks.nsPredicate = nil
                }*/
                
            }
            .onAppear {
                countBooks()
            }
        }
    }
    
    func countBooks(){
        let request: NSFetchRequest<Book> = Book.fetchRequest()
        if let list = try? self.dbContext.fetch(request) {
            totalBooks = list.count
        }
    }
    
    func deleteBook(indexes: IndexSet) async {
        await dbContext.perform {
            for index in indexes {
                dbContext.delete(listOfBooks[index])
            }
            
            do {
                try dbContext.save()
            } catch {
                print(error)
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
