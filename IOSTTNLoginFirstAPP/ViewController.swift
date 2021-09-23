//
//  ViewController.swift
//  IOSTTNLoginFirstAPP
//
//  Created by satyam dixit on 21/09/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginBttn: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        BorderSet()
    }

    /// button border -
    func BorderSet(){
        self.loginBttn.layer.borderWidth = 1
        self.loginBttn.clipsToBounds = true
        self.loginBttn.layer.cornerRadius = self.loginBttn.layer.frame.width / 20
        self.loginBttn.layer.borderColor = UIColor.black.cgColor
    }

    @IBAction func LoginBttnAction(_ sender: UIButton) {
        print("BTTN Tapped")
    }
    
}

