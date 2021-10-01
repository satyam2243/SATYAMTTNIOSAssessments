//
//  FifthVC.swift
//  iOSAssessment-6
//
//  Created by satyam dixit on 30/09/21.
//

import UIKit

class FifthVC: UIViewController {

    @IBOutlet weak var valueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        valueLabel.text = value1IS
        
    }
    
}

extension FifthVC {
    @IBAction func popToVC(_ sender: UIButton) {
        popToRootVC()
    }
}

extension FifthVC {
    func popToRootVC() {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
