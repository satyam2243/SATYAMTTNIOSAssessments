//
//  ThirdVC.swift
//  iOSAssessment-6
//
//  Created by satyam dixit on 30/09/21.
//

import UIKit

class ThirdVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
}


//MARK: IBActions--

extension ThirdVC {
    @IBAction func dismissVCButton(_ sender: UIButton) {
        dissmisVC()
    }
}

extension ThirdVC {
    func dissmisVC(){
        self.dismiss(animated: true, completion: nil)
    }

}

