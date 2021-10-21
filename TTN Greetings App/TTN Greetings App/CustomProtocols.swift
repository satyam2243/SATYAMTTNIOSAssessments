//
//  CustomProtocols.swift
//  TTN Greetings App
//
//  Created by Satyam Dixit on 14/10/21.
//

import Foundation
import UIKit

protocol Loggable {
    var isUserLoggedIn: Bool { get }
    func saveUserInfo()
    func removeUserInfo()
}


protocol ShowToastProtocol {
    func showToastMsg(title: String, message: String)
}


protocol Roundable {
    func round()
}

protocol Bordable {
    func setBorder()
}

protocol Loadable: AnyObject {
    func loadIndicator(onView view: UIView)
}

/** error Protocol */
protocol ErrorViewProtocol: AnyObject {
    func showError(onView view: UIView)
}


