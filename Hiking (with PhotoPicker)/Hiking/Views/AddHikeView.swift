//
//  AddHikeView.swift
//  Hiking
//
//  Created by Kurt McMahon on 3/21/23.
//

import SwiftUI
import PhotosUI

struct AddHikeView: View {
    // this variable give me error as i also need to initialze them below in struct AddHikeView_Previews.
    @Binding var isPresented: Bool
    @Binding var hikes: [Hike]
    // this is the array i am going to append the new hikes
    
    // this connects with sheet method that has this parameters and whatever we code here will be displayed when usser clicks + button.
    
    
    // i am gonna use this below state variables hikeName and miles to create a hike.
    @State private var hikeName = ""
    @State private var miles = 0.1
    
    // With this i am going to select image from gallery
    @State private var selectedItem: PhotosPickerItem? = nil
    
    // when i select the image i also need the data of it. The data will be here bu using onchange functionality line 88
    @State private var selectedImageData: Data? = nil
    
    // If if dont enter anything in hikename tab then i get this error.
    @State private var errorMessage = ""
    @State private var showAlert = false
    
    // we define this computed property, when we click photo button and select image then the image will be in data, passing this data to UIImage which is displayed in hikecell and some other places to access this selected image.
    var image: UIImage {
        if let data = selectedImageData, let image = UIImage(data: data) {
            return image
        } else {
            return UIImage()
        }
    }
    
    var body: some View {
        // All of the code will be for + button navigation. and i am using navigation task so that i can have cancel and save as show in tool bar.
        NavigationStack {
            VStack(spacing: 16) {
                Text("Name")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.top, 16)
                
                TextField("Enter hike name", text: $hikeName)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
                
                Text("Distance")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.top, 16)
                
                Slider(value: $miles, in: 0.1...30.0, step: 0.1, minimumValueLabel: Text("0.1"), maximumValueLabel: Text("30.0")) {}
                    .padding(.horizontal)
                
                Text(String(format: "%.1f miles", miles))
                    .font(.title3)
                    .fontWeight(.semibold)

                Text("Image")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.top, 16)
                
                // to select images from gallery, for that define statevariable selecteditem above.
                
                PhotosPicker(selection: $selectedItem, matching: .images, photoLibrary: .shared()) {
                    // the below code is for photo lobrary button.
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
                // when user select the imaage i need to load this into data(selectedImageData), for that is the below code
                .onChange(of: selectedItem) { newItem in
                    Task {
                        if let data = try? await newItem?.loadTransferable(type: Data.self) {
                            selectedImageData = data
                        }
                    }
                }
                
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                Spacer()
            }  // VSTACK
            .navigationTitle("Add Hike")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        // this makes modal for new hike go away.
                        isPresented = false
                    }
                }

                ToolbarItem(placement: .confirmationAction) {
                    // this button saves info in array.
                    Button("Save") {
                        // edge case validation.
                        // Validate the user's input
                        if hikeName.isEmpty {
                            errorMessage = "Please enter a name for the hike"
                            showAlert = true
                        } else if selectedImageData == nil {
                            errorMessage = "Please select a photo for the hike"
                            showAlert = true
                        } else {
                            
                            // Add a new Hike to the array with its name,image and miles.
                            
                            hikes.append(Hike(name: hikeName, image: image, miles: miles))
                            
                            // Dismiss the modal
                            isPresented = false
                        } // IF
                    } // BUTTON
                } // TOOLBARITEM
            } // TOOLBAR
        } // NAVIGATIONSTACK
        
        // we put a alert when we save the hike without hike name, image or selected mile we get this error message
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Error"), message: Text(errorMessage))
        }
    } // BODY
} // STRUCT

struct AddHikeView_Previews: PreviewProvider {
    
    @State static var isPresented = true
    // creating empty array of Hike
    @State static var hikes = [Hike]()
    
    static var previews: some View {
        AddHikeView(isPresented: $isPresented, hikes: $hikes)
    }
}
