//
//  SecondVC.swift
//  iOSAssessment-6
//
//  Created by satyam dixit on 30/09/21.
//

import UIKit

class SecondVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let nav = self.navigationController?.navigationBar
    
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor.white
        nav?.backgroundColor = UIColor.blue
      
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
          
        let image = UIImage(named: "Complete")
        imageView.image = image
          
        navigationItem.titleView = imageView
    }
    
}

//MARK: IBActions--

extension SecondVC {
    @IBAction func popThisVC(_ sender: UIButton) {
        popVC()
    }
    
    @IBAction func present4thVCButton(_ sender: UIButton) {
        PresentFourthVC()
    }
}

extension SecondVC {
    func popVC(){
        self.navigationController?.popViewController(animated: true)
    }
    
    ///Present 4th ViewController
    func PresentFourthVC(){
        let myStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = myStoryboard.instantiateViewController(withIdentifier: "FourthVC") as? FourthVC
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    ///Navigation Bar Customization
    func navBarCustomization(){
        
    }
}
