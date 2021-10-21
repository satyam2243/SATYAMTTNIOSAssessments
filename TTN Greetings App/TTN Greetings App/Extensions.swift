//
//  Extensions.swift
//  TTN Greetings App
//
//  Created by satyam dixit on 21/10/21.
//

import Foundation
import UIKit

// let date = Date()

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

extension UIViewController {
    
    func alertShow(title: String, message: String) {
        // create the alert
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil))

        // show the alert
        self.present(alert, animated: true, completion: nil)
    }

}
