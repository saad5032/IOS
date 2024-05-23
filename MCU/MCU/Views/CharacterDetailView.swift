//
//  CharacterDetailView.swift
//  MCU
//
//  Created by Kurt McMahon on 10/31/23.
//

import SwiftUI

struct CharacterDetailView: View {
    
    var character: CharacterViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            Text(character.name)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .multilineTextAlignment(.center)
            
            AsyncImage(url: URL(string: character.url)) { image in
                image.resizable()
                    .scaledToFit()
                    .cornerRadius(16)
            } placeholder: {
                ProgressView()
            }
            .padding(.horizontal)
            
            Text("Real Name")
                .font(.title)
                .fontWeight(.semibold)
            
            Text(character.realName)
                .font(.title2)
            
            Text("Affiliation")
                .font(.title)
                .fontWeight(.semibold)
            
            Text(character.affiliation)
                .font(.title2)
            
            Spacer()
        }
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailView(character: CharacterViewModel.default)
    }
}
