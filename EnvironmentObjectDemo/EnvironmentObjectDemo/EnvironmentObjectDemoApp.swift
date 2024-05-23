//
//  EnvironmentObjectDemoApp.swift
//  EnvironmentObjectDemo
//
//  Created by Kurt McMahon on 3/22/22.
//

import SwiftUI

@main
struct EnvironmentObjectDemoApp: App {
    // I defined instace usersetting class inside app and then put this class in evironment object. Any view file can access this class now via enironment object property without passing to it.
    let userSettings = UserSettings()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(userSettings)
        }
    }
}
