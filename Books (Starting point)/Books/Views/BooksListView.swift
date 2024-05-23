//
//  BooksListView.swift
//  Books
//
//  Created by Kurt McMahon on 11/2/23.
//

import SwiftUI

struct BooksListView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BooksListView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
