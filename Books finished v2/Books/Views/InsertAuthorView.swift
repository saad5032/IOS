//
//  InsertAuthorView.swift
//  Books
//
//  Created by Kurt McMahon on 11/7/23.
//

import SwiftUI

struct InsertAuthorView: View {
    
    @Environment(\.managedObjectContext) private var dbContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var inputName = ""

    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Name: ")
                    TextField("Insert name", text: $inputName)
                        .textFieldStyle(.roundedBorder)
                }
                
                HStack {
                    Spacer()
                    Button("Save") {
                        let newName = inputName.trimmingCharacters(in: .whitespaces)
                        if !newName.isEmpty {
                            Task(priority: .high) {
                                await storeAuthor(name: newName)
                            }
                        }
                    }
                }

                Spacer()
            }
            .padding()
            .navigationTitle("Add Author")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func storeAuthor(name: String) async {
        await dbContext.perform {
            let newAuthor = Author(context: dbContext)
            newAuthor.name = name
            
            do {
                try dbContext.save()
                dismiss()
            } catch {
                print(error)
            }
        }
    }

}

struct InsertAuthorView_Previews: PreviewProvider {
    static var previews: some View {
        InsertAuthorView()
    }
}
