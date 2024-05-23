//
//  LoadDataModel.swift
//  A4
//
//  Created by Saaduddin Syed on 11/12/23.
//

import Foundation

class DetailViewModel: ObservableObject {
    
    @Published var presidentsArray: [DataModel] = []
    @Published var characters: [CharacterViewModel] = []
    
    func loadPropertyListData() {
        // I am providing the path of states(data i downloaded)
        guard let path = Bundle.main.path(forResource: "presidents", ofType: "plist"),
              
            // I am using file manager (responsible to read,write,create,update the files) to read the states file which has array of dictionaries. All this data will be in binary format after reading and is in instance xml
              
                let xml = FileManager.default.contents(atPath: path) else {
                fatalError("Unable to access property list presidents.plist")
        }
        
        do {
            // I am decoding xml below to get all the data in my published variable stateArray. The stateArray is a datatype of array which can hold statedata dictionaries (statemodel tells the code what type of data is in dictionaries of a statedata)
            presidentsArray = try PropertyListDecoder().decode([DataModel].self, from: xml)
            presidentsArray.sort{
                $0.Number < $1.Number
            }
            self.characters =  presidentsArray.map(CharacterViewModel.init)
            
        } catch {
            fatalError("Unable to decode property list presidents.plist")
        }
    }
}
