//
//  CharacterModel.swift
//  A4
//
//  Created by Saaduddin Syed on 11/12/23.
//

import Foundation
struct CharacterViewModel {
    var character: DataModel
    
    var Name: String {
        return character.Name
    }
    
    var Number : Int {
        return character.Number
    }

    var startDate: String {
        return character.startDate
    }

    var endDate: String {
        return character.endDate
    }
    var Nickname: String {
        return character.Nickname
    }
    var PoliticalParty: String {
        return character.PoliticalParty
    }

    static var `default`: CharacterViewModel {
        let character = DataModel(Name: "George Washington", Number: 1 , startDate: "April 30, 1789", endDate: "March 3, 1797",Nickname:"&quot;Father of His Country&quot;",PoliticalParty :"None")
        return CharacterViewModel(character: character)
    }
}

