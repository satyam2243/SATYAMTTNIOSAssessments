//
//  LoginViewController.swift
//  TTN Greetings App
//
//  Created by satyam dixit on 20/10/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private let UserDatabase = [User(username: "Satyam", password: "12345678")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    
}
