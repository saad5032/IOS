//
//  A6App.swift
//  A6
//
//  Created by Saaduddin Syed on 11/28/23.
//

import SwiftUI

@main
struct A6App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
