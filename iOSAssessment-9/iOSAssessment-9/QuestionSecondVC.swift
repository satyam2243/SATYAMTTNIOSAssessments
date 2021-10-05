//
//  QuestionSecondVC.swift
//  iOSAssessment-9
//
//  Created by Satyam Dixit on 05/10/21.
//

import UIKit

class QuestionSecondVC: UIViewController {
    
    @IBOutlet weak var roundedImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roundedImg.layer.cornerRadius = roundedImg.frame.height / 2
    }
    
}
