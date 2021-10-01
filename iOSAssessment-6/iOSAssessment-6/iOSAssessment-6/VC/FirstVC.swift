//
//  ViewController.swift
//  iOSAssessment-6
//
//  Created by satyam dixit on 30/09/21.
//

import UIKit

var value1IS = ""

class FirstVC: UIViewController {
    
    @IBOutlet weak var valueTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        valueTextField.delegate = self
    }
    
}

//MARK: IBActions---


extension FirstVC {
    
    @IBAction func pushVCButton(_ sender: UIButton) {
        PushSecondVC()
    }
    
    
    @IBAction func presentVCButton(_ sender: UIButton) {
        PresentSecondVC()
    }
    
}

extension FirstVC: UITextFieldDelegate {
    
    /// Push 2nd View Controller
    func PushSecondVC(){
        let myStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = myStoryboard.instantiateViewController(withIdentifier: "SecondVC") as? SecondVC
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    ///Present 2nd ViewController
    func PresentSecondVC(){
        let myStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = myStoryboard.instantiateViewController(withIdentifier: "ThirdVC") as? ThirdVC
        
        self.navigationController?.present(vc!, animated: true, completion: nil)
    }
    
    ///Function For passing value--
    func textFieldDidEndEditing(_ textField: UITextField) {
        value1IS = valueTextField.text ?? "default"
    }
}
