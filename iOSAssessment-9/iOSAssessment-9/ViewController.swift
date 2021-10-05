//
//  ViewController.swift
//  iOSAssessment-9
//
//  Created by Satyam Dixit on 05/10/21.
//

import UIKit

class ViewController: UIViewController {

    let myStoryborad = UIStoryboard(name: "Main", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
}

extension ViewController {
    
    @IBAction func queOneButton(_ sender: UIButton) {
        let vc = myStoryborad.instantiateViewController(withIdentifier: "QuestionFirstVC") as? QuestionFirstVC
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func queTwoButton(_ sender: UIButton) {
        let vc = myStoryborad.instantiateViewController(withIdentifier: "QuestionSecondVC") as? QuestionSecondVC
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func queThreeButton(_ sender: UIButton) {
        let vc = myStoryborad.instantiateViewController(withIdentifier: "QuestionThirdVC") as? QuestionThirdVC
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func queFourButton(_ sender: UIButton) {
        let vc = myStoryborad.instantiateViewController(withIdentifier: "QuestionFourthVC") as? QuestionFourthVC
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func queFiveButton(_ sender: UIButton) {
        let vc = myStoryborad.instantiateViewController(withIdentifier: "QuestionFifthVC") as? QuestionFifthVC
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
