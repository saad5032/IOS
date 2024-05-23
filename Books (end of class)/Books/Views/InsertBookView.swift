//
//  InsertBookView.swift
//  Books
//
//  Created by Kurt McMahon on 11/2/23.
//

import SwiftUI

struct InsertBookView: View {
    
    @Environment(\.managedObjectContext) private var dbContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var inputTitle = ""
    @State private var inputYear = ""
    @State private var inputAuthor = ""

    var body: some View {
        NavigationStack {
            VStack(spacing: 12) {
                HStack {
                    Text("Title: ")
                    TextField("Insert title", text: $inputTitle)
                        .textFieldStyle(.roundedBorder)
                }
                
                HStack {
                    Text("Year: ")
                    TextField("Insert year", text: $inputYear)
                        .textFieldStyle(.roundedBorder)
                }

                HStack {
                    Text("Author: ")
                    TextField("Insert author", text: $inputAuthor)
                        .textFieldStyle(.roundedBorder)
                }

                Spacer()
            }
            .padding()
            .navigationTitle("Add Book")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let newTitle = inputTitle.trimmingCharacters(in: .whitespaces)
                        let newAuthor = inputAuthor.trimmingCharacters(in: .whitespaces)
                        let newYear = Int32(inputYear)
                        
                        if !newTitle.isEmpty && !newAuthor.isEmpty && newYear != nil {
                            Task(priority: .high) {
                                await storeBook(title: newTitle, year: newYear!, author: newAuthor)
                            }
                        }
                        
                    }
                }
            }
        }
    }
    
    private func storeBook(title: String, year: Int32, author: String) async {
        await dbContext.perform {
            let newBook = Book(context: dbContext)
            newBook.title = title
            newBook.year = year
            newBook.author = author
            newBook.cover = nil
            
            do {
                try dbContext.save()
                dismiss()
            } catch {
                print(error)
            }
        }
    }
}

struct InsertBookView_Previews: PreviewProvider {
    static var previews: some View {
        InsertBookView()
    }
}
