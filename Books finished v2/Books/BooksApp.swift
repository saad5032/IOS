//
//  BooksApp.swift
//  Books
//
//  Created by Kurt McMahon on 11/2/23.
//

import SwiftUI

@main
struct BooksApp: App {
    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            BooksListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
