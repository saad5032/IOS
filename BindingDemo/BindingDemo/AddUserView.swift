//
//  AddUserView.swift
//  BindingDemo
//
//  Created by Kurt McMahon on 3/22/22.
//

import SwiftUI

struct AddUserView: View {
    
    @Binding var isPresented: Bool
    @Binding var users: [String]
    
    @State private var userName = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("User name", text: $userName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        isPresented = false
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        
                        if !userName.isEmpty {
                            users.append(userName)
                        }
                        
                        isPresented = false
                    }
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct AddUserView_Previews: PreviewProvider {
    
    @State static var isPresented = true
    @State static var users = [String]()
    
    static var previews: some View {
        AddUserView(isPresented: $isPresented, users: $users)
    }
}
