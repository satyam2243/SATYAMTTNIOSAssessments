//
//  ViewController.swift
//  TTN Greetings App
//
//  Created by Satyam Dixit on 14/10/21.
//

import UIKit

class ViewController: UIViewController {

    let date = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(date.formattedDate)
        
    }

}

extension Date {
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "DD/MM/YYYY"
        return dateFormatter.string(from: self)
    }
//    func formattedDate() -> String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "DD/MM/YYYY"
//        return dateFormatter.string(from: self)
//    }
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
