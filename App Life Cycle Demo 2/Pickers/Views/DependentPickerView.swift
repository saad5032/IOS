//
//  DependentPickerView.swift
//  Pickers
//
//  Created by Kurt McMahon on 3/3/22.
//

import SwiftUI

struct DependentPickerView: View {
    
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
                            Text(pickerVM.stateArray[index].stateName).tag(index)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: geometry.size.width/2, alignment: .center)
                    .clipped()
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
            print("DependentPickerView appeared")
            pickerVM.loadPropertyListData()
        }
        .onDisappear {
            print("DependentPickerView disappeared")
        }

    }
}

struct DependentPickerView_Previews: PreviewProvider {
    static var previews: some View {
        DependentPickerView()
    }
}
