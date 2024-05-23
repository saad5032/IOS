//
//  Book+ViewModel.swift
//  Books
//
//  Created by Kurt McMahon on 11/2/23.
//

import Foundation
import SwiftUI

extension Book {
    var showTitle: String {
        return title ?? "Undefined"
    }
    
    var showYear: String {
        return String(year)
    }

    var showAuthor: String {
        return author?.name ?? "Undefined"
    }

    var showCover: UIImage {
        if let data = cover, let image = UIImage(data: data) {
            return image
        } else {
            return UIImage(named: "nopicture")!
        }
    }
}
