//
//  Model.swift
//  iOSAssessment-18
//
//  Created by satyam dixit on 26/10/21.
//

import Foundation

///Model to Store Data
struct Item {
    let authorName: String?
    let authorImage: String?
    
    init(authorName: String, authorImage: String) {
        self.authorName = authorName
        self.authorImage = authorImage
    }
}
