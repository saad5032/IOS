//
//  InsertBookView.swift
//  Books
//
//  Created by Kurt McMahon on 11/2/23.
//

import SwiftUI
import PhotosUI

struct InsertBookView: View {
    
    @Environment(\.managedObjectContext) private var dbContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var inputTitle = ""
    @State private var inputYear = ""
    @State private var inputAuthor = ""
    
    @State var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil

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

                PhotosPicker(selection: $selectedItem, matching: .images, photoLibrary: .shared()) {
                    HStack {
                        Image(systemName: "photo")
                            .font(.system(size: 20))
                        
                        Text("Photo Library")
                            .font(.headline)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(20)
                    .padding(.horizontal)
                }
                .onChange(of: selectedItem) { newItem in
                    Task {
                        if let data = try? await newItem?.loadTransferable(type: Data.self) {
                            selectedImageData = data
                        }
                    }
                }
                
                if let selectedImageData, let uiImage = UIImage(data: selectedImageData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                        .padding()
                } else {
                    Image("nopicture")
                        .resizable()
                        .scaledToFit()
                        .padding()
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
            if selectedImageData != nil {
                newBook.cover = selectedImageData
            } else {
                newBook.cover = nil
            }
            
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
