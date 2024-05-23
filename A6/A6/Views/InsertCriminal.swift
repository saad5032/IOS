//
//  InsertCriminal.swift
//  A6
//
//  Created by Saaduddin Syed on 11/29/23.
//

import SwiftUI
import PhotosUI

struct InsertCriminal: View {
    @Environment(\.managedObjectContext) private var dbContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var inputAlias = ""
    @State private var inputName = ""
    @State private var inputNotes = ""
    
    @State var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    
    
    var body: some View {
    
        NavigationStack {
            ZStack{
                Color(red: 20/255, green: 20/255, blue: 20/255)
                    .ignoresSafeArea()
                VStack(spacing: 12) {
                    HStack {
                        Text("Alias: ")
                        TextField("Insert Alias", text: $inputAlias)
                            .textFieldStyle(.roundedBorder)
                    }
                    
                    HStack {
                        Text("Name: ")
                        TextField("Insert Name", text: $inputName)
                            .textFieldStyle(.roundedBorder)
                    }
                    
                    VStack {
                        Text("Notes: ")
                        TextEditor(text: $inputNotes)
                            .textFieldStyle(.roundedBorder)
                            .frame(height: 100)
                            .scrollContentBackground(.hidden)
                            .background(.black)
                            .padding(1)
                            .cornerRadius(10)
                    }
                    
                    
                    
                    PhotosPicker(selection: $selectedItem, matching: .images, photoLibrary: .shared()) {
                        // the below code is for photo lobrary button.
                        HStack {
                            Image(systemName: "photo")
                                .font(.system(size: 20))
                            
                            Text("Photo Library")
                                .font(.headline)
                        }
                        .frame(minWidth: 100, maxWidth: 250, minHeight: 0, maxHeight: 50)
                        .background(Color.orange)
                        .foregroundColor(Color.black)
                        .cornerRadius(20)
                        .padding(20)
                    }
                    
                    .onChange(of: selectedItem) { newItem in
                        Task {
                            if let data = try? await newItem?.loadTransferable(type: Data.self) {
                                selectedImageData = data
                            }
                        }
                    }
                    
                    
                    
                    if let selectedImageData, let uiImage = UIImage(data: selectedImageData)
                    {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 300)
                            .cornerRadius(15)
                        
                    }
                    else {
                        Image("nopicture")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 300)
                            .cornerRadius(15)
                        
                    }
                    
                    Spacer()
                }//vstack
       

        .padding()
        .navigationTitle("Add Fugitive")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .cancellationAction){
                Button("Cancel"){
                    dismiss()
                }
            }
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    let newAlias = inputAlias.trimmingCharacters(in: .whitespaces)
                    let newName = inputName.trimmingCharacters(in: .whitespaces)
                    let newNotes = inputNotes.trimmingCharacters(in: .whitespaces)
                    
                    if !newAlias.isEmpty && !newName.isEmpty && !newNotes.isEmpty {
                        Task(priority: .high) {
                            await storeFugitive(alias: newAlias, name:  newName, notes: newNotes)
                        }
                    }
                    
                }
            }
        }
    }
        } // zstack
}
    

    
private func storeFugitive(alias: String, name: String, notes: String) async {
    await dbContext.perform {
        let newFugitive = Item(context: dbContext)
        newFugitive.alias = alias
        newFugitive.name = name
        newFugitive.notes = notes
    
        
        if selectedImageData != nil {
            newFugitive.image = selectedImageData
        } else {
            newFugitive.image = nil
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

struct InsertCriminal_Previews: PreviewProvider {
    static var previews: some View {
        InsertCriminal()
    }
}
