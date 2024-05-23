//
//  WebService.swift
//  MCU
//
//  Created by Kurt McMahon on 10/24/23.
//

import Foundation

class WebService {
    func fetchCharacters(url: URL?) async throws -> [MCUCharacter] {
        guard let url = url else {
            return []
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)

        let characters = try? JSONDecoder().decode([MCUCharacter].self, from: data)
        
        return characters ?? []
    }
}

