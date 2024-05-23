//
//  UserSettings.swift
//  EnvironmentObjectDemo
//
//  Created by Kurt McMahon on 3/22/22.
//

import Foundation
import SwiftUI

// The user setting file has a class UserSettings which conforms to protocol ObservableObject to use the property @Published.

//In practical terms, that means whenever an object (score) with a property marked @Published with the help of protocol ObservableObject is changed, all views using that object (like UserSettings.score) will be reloaded to reflect those changes.

// The content view, has this class UserSettings stored in @StateObject and thus content view has access to the @published score var.

// Content view now have two other views, increment view and decrement view which are using @ObservedObject to point towards @published score var of Content View.

// If i make changes in score var to 5 in content view file, by using increment view functionality, then if you print score value in increment view file and decrement view file , 5 will be printed.

// This shows using of @published with the help of protocol ObservableObject, if var1 is changed then views which have var1 will be also be changed.

//  to store the data of var1 in some place in memory we use @StateObject in our main file view and use @ObservedObject in other views to point to that memory, and finally all views will share the same value of var1 as it is declared as @published.


class UserSettings: ObservableObject {

    @Published var score = 0
}
