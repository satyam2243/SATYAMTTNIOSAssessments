//
//  LoginViewController.swift
//  TTN Greetings App
//
//  Created by satyam dixit on 20/10/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPhoneTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private let UserDatabase = [User(username: "Satyam", password: "12345678")]
    
    var logableDelegate: Loggable?
    var showToastDelegate: ShowToastProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logableDelegate = self
        showToastDelegate = self
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        
        if (self.usernameTextField.text?.isFieldEmpty != false && self.userPhoneTextField.text?.isFieldEmpty != false && self.passwordTextField.text?.isFieldEmpty != false && self.userEmailTextField.text?.isFieldEmpty != false) {
            
            // show toast fill all fields
            showToastDelegate?.showToastMsg(title: "LoginFailed", message: "Fill All Fields")
            
        } else {
            if ((logableDelegate?.isUserLoggedIn) != nil) {
                 navigateToUserProfile()
            } else {
                logableDelegate?.saveUserInfo()
                navigateToUserProfile()
            }
        }
        
    }
    
    private func navigateToUserProfile() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "UserInfoViewController") as? UserInfoViewController
        vc?.userPhone = self.userPhoneTextField.text ?? "defaultUser@gmail.com"
        vc?.username =  self.usernameTextField.text ?? "DefaultUser"
        vc?.userEmail = self.userEmailTextField.text ?? "123456789"
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    
}


extension LoginViewController: Loggable {

    var isUserLoggedIn: Bool {
        if UserDefaults.standard.bool(forKey: "usernsme") {
            return true
        } else {
            return false
        }
    }

    func saveUserInfo() {
        
        let userName = self.usernameTextField.text
        let userEmail = self.userEmailTextField.text
        let userPhone = self.userPhoneTextField.text
        
        UserDefaults.setValue(userName, forKey: "username")
        UserDefaults.setValue(userEmail, forKey: "useremail")
        UserDefaults.setValue(userPhone, forKey: "userphone")
    }
    
    func removeUserInfo() {
        UserDefaults.standard.removeObject(forKey: "username")
        UserDefaults.standard.synchronize()
    }

}

extension LoginViewController: ShowToastProtocol {
    
    func showToastMsg(title: String, message: String) {
      alertShow(title: title, message: message)
    }
}
