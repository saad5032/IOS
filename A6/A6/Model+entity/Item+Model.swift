//
//  Model.swift
//  A6
//
//  Created by Saaduddin Syed on 11/28/23.
//

import Foundation
import SwiftUI
import PhotosUI


extension Item {
    
    var Alias: String {
        return alias ?? "Undefined"
    }
    
    var Custody : Bool {
        return false
    }

    var Image : UIImage {
        if let data = image, let Img = UIImage(data: data) {
            return Img
        }
        else {
            return UIImage(named: "nopicture")!
        }
    }
    
    var Name : String {
        return name ?? "Undefined"
    }

    
    var Notes : String {
        return notes ?? "Undefined"
    }
    
}



