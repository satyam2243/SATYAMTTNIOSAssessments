//
//  Extensions.swift
//  TTN Greetings App
//
//  Created by satyam dixit on 21/10/21.
//

import Foundation
import UIKit


extension Date {
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "DD/MM/YYYY"
        return dateFormatter.string(from: self)
    }
}


extension String {
//    func isEmptyString() -> Bool {
//        self.isEmpty
//    }
    var isFieldEmpty: Bool {
       // return self.isEmpty
        self.isEmpty
    }
    
    var isValidPassword: Bool {
        self.count > 8
    }
    
}

extension UITextField: Validator {
    var isFieldEmpty: Bool {
        self.text?.isEmpty ?? true
    }
    
//    var isValidPassword: Bool {
//        (self.text?.count ?? 0) > 8 
//    }
}

