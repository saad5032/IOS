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
        // I am providing the path of states(data i downloaded)
        guard let path = Bundle.main.path(forResource: "states", ofType: "plist"),
              
            // I am using file manager (responsible to read,write,create,update the files) to read the states file which has array of dictionaries. All this data will be in binary format after reading and is in instance xml
              
                let xml = FileManager.default.contents(atPath: path) else {
            fatalError("Unable to access property list states.plist")
        }
        
        do {
            // I am decoding xml below to get all the data in my published variable stateArray. The stateArray is a datatype of array which can hold statedata dictionaries (statemodel tells the code what type of data is in dictionaries of a statedata)
            stateArray = try PropertyListDecoder().decode([StateModel].self, from: xml)
            
            // I am setting my defined published variable zips
            zips = stateArray[0].zipCodes
        } catch {
            fatalError("Unable to decode property list states.plist")
        }
    }
}
