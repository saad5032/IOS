//
//  CellView.swift
//  A4
//
//  Created by Saaduddin Syed on 11/12/23.
//

import SwiftUI

struct CellView: View {
    var character: CharacterViewModel

    var body: some View {

        VStack(alignment: .leading) {
            Text(character.Name)
                .font(.headline)
                .fontWeight(.heavy)
            Text(character.PoliticalParty)
                .font(.subheadline)
        }
       
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(character: CharacterViewModel.default)
    }
}
