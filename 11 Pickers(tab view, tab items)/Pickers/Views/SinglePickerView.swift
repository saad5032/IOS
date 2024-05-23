//
//  SinglePickerView.swift
//  Pickers
//
//  Created by Kurt McMahon on 2/24/22.
//

import SwiftUI

struct SinglePickerView: View {
    
    let pickerData = [["Luke", "Leia", "Chebacca", "R2-D2", "C-3PO", "Lando", "Rey", "Finn", "Grogu"],
        ["Pike", "Kirk", "Picard", "Sisko", "Janeway", "Georgiou", "Burnham"]]
    
    @State private var selectedSetting = 0
    @State private var selected = "Luke"
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            Text("Choose your Favorite Character")
                .font(.title)
                .bold()
                .multilineTextAlignment(.center)
                .padding()
            
            // Picker swift ui method, and below here its selecting either 0 or 1 based on two texts views, the selected int is stored in selectedSetting.
            Picker("Setting", selection: $selectedSetting) {
                Text("Star Wars").tag(0)
                Text("Star Trek").tag(1)
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)

            // pickerData is 2d array, if selectedSetting is 0 then array 1 is selected else array 2.
            Picker("Favorite Character", selection: $selected) {
                ForEach(pickerData[selectedSetting], id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.wheel)
            
            Button("Select") {
                showAlert = true
            }
            
            Spacer()
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("You selected \(selected)"), message: Text("Thank you for choosing"), dismissButton: .default(Text("You're welcome")))
        }
    }
}

struct SinglePickerView_Previews: PreviewProvider {
    static var previews: some View {
        SinglePickerView()
    }
}
