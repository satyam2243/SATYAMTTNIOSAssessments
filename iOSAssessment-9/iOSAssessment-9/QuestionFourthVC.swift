//
//  QuestionFourthVC.swift
//  iOSAssessment-9
//
//  Created by Satyam Dixit on 05/10/21.
//

import UIKit

class QuestionFourthVC: UIViewController {

    @IBOutlet weak var smileyImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        smileyImg.layer.cornerRadius = smileyImg.frame.height / 2

    }

}
