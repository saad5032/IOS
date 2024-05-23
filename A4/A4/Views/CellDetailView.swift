//
//  CellDetailView.swift
//  A4
//
//  Created by Saaduddin Syed on 11/12/23.
//

import SwiftUI

var format : NumberFormatter {
    let f = NumberFormatter()
    f.numberStyle = .ordinal
    return f
}

struct CellDetailView: View {
    var character: CharacterViewModel
    var body: some View {
        VStack{
            Text(character.Name)
                .font(.title)
                .fontWeight(.bold)
                .padding(5)
            
            Text("\(NSNumber(value: character.Number), formatter:format) President of the United States")
                .fontWeight(.semibold)
                .padding(5)
            
            Text("(\(character.startDate) to \(character.endDate))")
                .italic()
                .padding(10)
   
            Image("seal") // bottom
                .resizable()
                .frame(width: 240, height: 360)


            Text("Nickname")
                    .fontWeight(.semibold)
                    .padding(5)

            Text(character.Nickname)

            Text("Political Party")
                    .fontWeight(.semibold)
                    .padding(5)
      
            Text(character.PoliticalParty)
          
    
            Spacer()

        }
    }
}

struct CellDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CellDetailView(character: CharacterViewModel.default)
    }
}
