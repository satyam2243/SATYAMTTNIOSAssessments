//
//  UIView+Customization.swift
//  TTN Greetings App
//
//  Created by Satyam Dixit on 14/10/21.
//

import Foundation
import UIKit

protocol Roundable {
    func round(view: UIView)
}

protocol Bordable {
    func setBorder(onView view: UIView)
}

protocol Loadable: AnyObject {
    func loadIndicator(onView view: UIView)
}

/** error Protocol */
protocol ErrorViewProtocol: AnyObject {
    func showError(onView view: UIView)
}


