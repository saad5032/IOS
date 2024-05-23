//
//  ContentView.swift
//  A4
//
//  Created by Saaduddin Syed on 11/12/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var Data = DetailViewModel()

    var body: some View {
        NavigationStack {
            List{
                ForEach(Data.presidentsArray.indices, id: \.self) { index in
                    NavigationLink(destination: CellDetailView(character: Data.characters[index])){
                        CellView(character: Data.characters[index])
                    }
                }
            } //List
            .listStyle(.plain)
            .navigationTitle("Presidents")
            
        }// NavigationStack
        
        .onAppear {
            Data.loadPropertyListData()

        }//onAppear
    } // body
}//content view

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
