//
//  CharacterListView.swift
//  MCU
//
//  Created by Kurt McMahon on 10/24/23.
//

import SwiftUI

struct CharacterListView: View {
    
    @StateObject private var viewModel = CharacterListViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.characters, id: \.name) {
                    characterVM in
                    NavigationLink(destination: CharacterDetailView(character: characterVM)) {
//                        Text(characterVM.name)
                        CharacterCell(character: characterVM)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("MCU Characters")
        }
        .task {
            await viewModel.getCharacters()
        }
    }
}

struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView()
    }
}
