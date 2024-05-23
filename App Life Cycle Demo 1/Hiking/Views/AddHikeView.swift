//
//  AddHikeView.swift
//  Hiking
//
//  Created by Kurt McMahon on 3/8/22.
//

import SwiftUI

struct AddHikeView: View {
    
    @Binding var isPresented: Bool
    @Binding var hikes: [Hike]
    
    @State private var hikeName = ""
    @State private var miles = 0.1
    @State private var image: UIImage?
    
    @State private var showPhotoLibrary = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                Text("Name")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.top, 16)
                
                TextField("Enter hike name", text: $hikeName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                Text("Distance")
                    .font(.title3)
                    .fontWeight(.semibold)
                
                Slider(value: $miles, in: 0.1...30.0, step: 0.1, minimumValueLabel: Text("0.1"), maximumValueLabel: Text("30.0")) {}
                .padding(.horizontal)
                
                Text(String(format: "%.1f miles", miles))
                
                Text("Image")
                    .font(.title3)
                    .fontWeight(.semibold)
                
                if (image == nil) {
                    Image(uiImage: UIImage())
                        .resizable()
                        .scaledToFit()
                        .padding(.horizontal)
                } else {
                    Image(uiImage: image!)
                        .resizable()
                        .scaledToFit()
                        .padding(.horizontal)
                }
                
                Button(action: {
                    showPhotoLibrary = true
                }, label: {
                    HStack {
                        Image(systemName: "photo")
                            .font(.system(size: 20))
                        
                        Text("Photo Library")
                            .font(.headline)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .padding(.horizontal)
                })

                Spacer()
            } //: VSTACK
            .navigationTitle("Add Hike")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        isPresented = false
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        
                        // Create a new Hike from the values
                        // entered by the user.
                        
                        if !hikeName.isEmpty && image != nil {
                            // Create a new hike and append it to the array of hikes.
                            hikes.append(Hike(name: hikeName, image: image!, miles: miles))
                            
                            // Dismiss the modal.
                            isPresented = false
                        }
                        
                        // Show an alert.
                    }
                }
            }
        } //: NAVIGATIONVIEW
        .sheet(isPresented: $showPhotoLibrary) {
            ImagePicker(sourceType: .photoLibrary, selectedImage: $image)
        }
        .onAppear {
            print("AddHikeView appeared")
        }
        .onDisappear {
            print("AddHikeView disappeared")
        }

    } //: BODY
}

struct AddHikeView_Previews: PreviewProvider {
    
    @State static var isPresented = true
    @State static var hikes = [Hike]()
    
    static var previews: some View {
        AddHikeView(isPresented: $isPresented, hikes: $hikes)
    }
}
