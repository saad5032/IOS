//
//  CellView.swift
//  A6
//
//  Created by Saaduddin Syed on 11/28/23.
//

import SwiftUI

struct CellView: View {
    
    let item : Item
    
    var body: some View {
        HStack() {
            Image(uiImage: item.Image)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 70)
                .cornerRadius(20)


            VStack(alignment: .leading) {
                Text(item.Name)
                    .font(.title3)
                    .bold()

            }
        }
    }
}



struct CellView_Previews: PreviewProvider {
    
    static let viewContext = PersistenceController.preview.container.viewContext
    
    static var item: Item {
        let item = Item(context: viewContext)
        item.alias = "A Book"
        item.image = nil
        item.inCustody = false
        item.name = "Bane"
        item.notes = "Idiot monkey"
        
        return item
    }
    static var previews: some View {
        CellView(item: item)
    }
}
