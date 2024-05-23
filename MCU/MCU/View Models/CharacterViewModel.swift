//
//  CharacterViewModel.swift
//  MCU
//
//  Created by Kurt McMahon on 10/24/23.
//

import Foundation

struct CharacterViewModel {
    var character: MCUCharacter
    
    var name: String {
        return character.name
    }
    
    var realName: String {
        return character.realName
    }

    var affiliation: String {
        return character.affiliation
    }

    var url: String {
        return character.url
    }

    static var `default`: CharacterViewModel {
        let character = MCUCharacter(name: "Captain America", realName: "Steve Rogers", affiliation: "Avengers", url: "https://faculty.cs.niu.edu/~mcmahon/CS321/Images/Marvel/captain_america-300.jpg")
        return CharacterViewModel(character: character)
    }
}
