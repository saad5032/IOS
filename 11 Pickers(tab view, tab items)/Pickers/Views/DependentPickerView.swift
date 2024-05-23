//
//  DependentPickerView.swift
//  Pickers
//
//  Created by Kurt McMahon on 3/3/22.
//

import SwiftUI

struct DependentPickerView: View {
    
    // PickerViewModel() --> this is where the state data is loaded which is a property list of array.
    @StateObject var pickerVM = PickerViewModel()
    
    @State private var showAlert = false
    
    @State private var stateIndex = 0
    @State private var zipIndex = 0
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("Choose a State and Zip Code")
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding()
                
                HStack {
                    Picker("State", selection: $stateIndex) {
                        ForEach(pickerVM.stateArray.indices, id: \.self) { index in
                            
                // stateArry[0] is 1st dictionary (which have statename(string) and its zipcodes(array of strings))
                            
                // Similary stateArray[1] is 2nd dictionary which represent another state with its zipcodes
                
                // I am using  foreach and iterating (index) through all indices 0,1,2 ... in stateArray
                
                // I am using picker on every dictinary via stateArray[index] and accessing the statenames via .statename to display all the statenames and storing the index of the particular dictionary which has the statename selected by user as in $stateindex.
                
                            Text(pickerVM.stateArray[index].stateName).tag(index)
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(width: geometry.size.width/2, alignment: .center)
                    .clipped()
                    
                    // when i select particular statename then i can access its dictionary via stateArray[index], and get all the zipcodes via on change.
                    .onChange(of: stateIndex) { index in
                        pickerVM.zips = pickerVM.stateArray[index].zipCodes
                    }
                    
                    Picker("Zip Code", selection: $zipIndex) {
                        ForEach(pickerVM.zips.indices, id: \.self) { index in
                            Text(pickerVM.zips[index]).tag(index)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: geometry.size.width/2, alignment: .center)
                    .clipped()
                }
                
                Button("Select") {
                    showAlert = true
                }
                .padding()
                
                Spacer()
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("You selected zip code \(pickerVM.zips[zipIndex])"), message: Text("\(pickerVM.zips[zipIndex]) is in \(pickerVM.stateArray[stateIndex].stateName)"))
        }
        .onAppear {
            pickerVM.loadPropertyListData()
        }
    }
}

struct DependentPickerView_Previews: PreviewProvider {
    static var previews: some View {
        DependentPickerView()
    }
}
