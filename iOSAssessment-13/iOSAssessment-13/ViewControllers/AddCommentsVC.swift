//
//  AddCommentsVC.swift
//  iOSAssessment-13
//
//  Created by Satyam Dixit on 18/10/21.
//

import UIKit

class AddCommentsVC: UIViewController {

    @IBOutlet weak var addCommentsButton: UIButton!
    
    @IBOutlet weak var addCommentsTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addCommentsTextView.delegate = self
        self.addCommentsButton.isEnabled = false
        
    }
    
    
    @IBAction func addCommentsActionButton(_ sender: UIButton) {
        if self.addCommentsButton.isEnabled == true {
            /// GoTo PostApiDemoScene
            
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            
            let vc = storyboard.instantiateViewController(withIdentifier: "EmployeeCommetsVC") as? EmployeeCommetsVC
            
            self.navigationController?.pushViewController(vc!, animated: true)
            
        }
    }
    
}


extension AddCommentsVC: UITextViewDelegate {
    
    func textViewDidEndEditing(_ textView: UITextView) {
        
        if let text = addCommentsTextView.text, text.isEmpty {
            print("Text field is empty")
        } else {
            self.addCommentsButton.isEnabled = true
        }
    
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
}
