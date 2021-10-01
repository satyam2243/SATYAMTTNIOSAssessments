//
//  FourthVC.swift
//  iOSAssessment-6
//
//  Created by satyam dixit on 30/09/21.
//

import UIKit

class FourthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}

extension FourthVC {
    @IBAction func popToVC(_ sender: UIButton) {
        popToRootVC()
    }
    
    @IBAction func present5thVC(_ sender: UIButton) {
        PushFifthVC()
    }
}

extension FourthVC {
    func popToRootVC() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    ///Push 5th ViewController
    func PushFifthVC(){
        let myStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = myStoryboard.instantiateViewController(withIdentifier: "FifthVC") as? FifthVC
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}
