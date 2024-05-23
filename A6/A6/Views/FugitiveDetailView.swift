//
//  FugitiveDetailView.swift
//  A6
//
//  Created by Saaduddin Syed on 11/30/23.
//

import SwiftUI

struct FugitiveDetailView: View {

    @State var item : Item
   
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack{
            Text(item.Alias)
                .font(.title)
                .bold()
                .foregroundColor(.accentColor)
                .padding()
            
            HStack{
                Text("Real Name:")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.accentColor)
                    .padding(30)
                
                Text(item.Name)
                    .font(.title3)
                    .bold()
                    .padding(30)
            }
        
                Text("Notes:")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.accentColor)
            
            Text(item.Notes)
                .multilineTextAlignment(.center)
                .padding()
            
            Image(uiImage: item.Image)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(5)
                    .padding(50)
            
    
            Toggle("In Custody?", isOn: $item.inCustody)
                .padding(.horizontal)
                .foregroundColor(.accentColor)
                .onChange(of: item.inCustody) { newValue in
                                if newValue {
                                    dismiss()
                                }
                            }

            Spacer()
            
        }
    
       
    }
}


struct FugitiveDetailView_Previews: PreviewProvider {
    static let viewContext = PersistenceController.preview.container.viewContext
    
    static var item: Item {
        let item = Item(context: viewContext)
        item.alias = "Riddler"
        item.image = nil
        item.inCustody = false
        item.name = "Edward E. Nigma"
        item.notes = "Genius level intellect,master strategist,hand-to-hand combat,engineering, computer programming,manipulation,trap master, leadership, mystery of puzzles and riddles"
        
        return item
    }

    

    static var previews: some View {
        FugitiveDetailView(item: item)
    }
}
