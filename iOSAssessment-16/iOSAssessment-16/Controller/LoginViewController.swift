//
//  ViewController.swift
//  iOSAssessment-16
//
//  Created by Satyam Dixit on 27/10/21.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var usernameTextfield: UITextField!
    
    let validationObj = Model()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginButton(_ sender: UIButton) {
        let email = usernameTextfield.text
        let pass = passwordTextfield.text
        
        let result = validationObj.validate(email: email!, pass: pass!)
        
        if result.isValid {
            showAlert(msg : result.msg)
        }
        else{
            showAlert(msg : result.msg)
        }
    }
    
    func showAlert(msg : String) {
        let alert = UIAlertController(title: "Login", message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}

