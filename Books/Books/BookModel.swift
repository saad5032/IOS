//
//  BookModel.swift
//  Books
//
//  Created by Saaduddin Syed on 9/30/23.
//
//
import Foundation
// This struct is our model and has unique id. So that bookData is in this format.
//The Identifiable protocol is often used in SwiftUI to identify each instance uniquely within a collection or when working with lists.
//The id property is automatically initialized with a new UUID value whenever a new Book instance is created
struct Book : Identifiable {
    let id = UUID()
    var image : String
    var authors : String
    var title : String
    var edition : String
    var description : String
    var categories = ["","",""]
    var price = Double()
}


