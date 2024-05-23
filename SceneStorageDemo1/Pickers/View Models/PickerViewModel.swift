//
//  PickerViewModel.swift
//  Pickers
//
//  Created by Kurt McMahon on 3/1/22.
//

import Foundation

class PickerViewModel: ObservableObject {
    @Published var stateArray: [StateModel] = []
    @Published var zips: [String] = []
    
    func loadPropertyListData() {
        guard let path = Bundle.main.path(forResource: "states", ofType: "plist"), let xml = FileManager.default.contents(atPath: path) else {
            fatalError("Unable to access property list states.plist")
        }
        
        do {
            stateArray = try PropertyListDecoder().decode([StateModel].self, from: xml)
            
            zips = stateArray[0].zipCodes
        } catch {
            fatalError("Unable to decode property list states.plist")
        }
    }
}
