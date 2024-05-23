//
//  CharacterCell.swift
//  MCU
//
//  Created by Kurt McMahon on 10/31/23.
//

import SwiftUI

struct CharacterCell: View {
    
    var character: CharacterViewModel
    
    var body: some View {
        HStack {
            
            AsyncImage(url: URL(string: character.url)) { image in
                image.resizable()
                    .cornerRadius(6)
            } placeholder: {
                ProgressView()
            }
            .frame(width: 50, height: 50)
            
            VStack(alignment: .leading) {
                Text(character.name)
                    .font(.headline)
                    .fontWeight(.heavy)
                Text(character.realName)
                    .font(.subheadline)
            }
            
        }
    }
}

struct CharacterCell_Previews: PreviewProvider {
    static var previews: some View {
        CharacterCell(character: CharacterViewModel.default)
    }
}
