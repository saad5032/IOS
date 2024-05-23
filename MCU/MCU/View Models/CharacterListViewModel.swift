//
//  CharacterListViewModel.swift
//  MCU
//
//  Created by Kurt McMahon on 10/24/23.
//

import Foundation

@MainActor
class CharacterListViewModel: ObservableObject {
    
    @Published var characters: [CharacterViewModel] = []
    
    func getCharacters() async {
        
        do {
            var characters = try await WebService().fetchCharacters(url: Constants.Urls.charactersUrl)
            characters.sort {
                $0.name < $1.name
            }
            
            self.characters = characters.map(CharacterViewModel.init)
        } catch {
            print(error)
        }
    }
}


