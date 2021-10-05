//
//  ViewController.swift
//  iosAssessment-7
//
//  Created by satyam dixit on 03/10/21.
//

import UIKit

class SignUPVC: UIViewController {
    
    var imagePicker = UIImagePickerController()
    
    //MARK: IBOutlets--
    //MARK:-
    @IBOutlet weak var tfUserName: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPhoneNo: UITextField!
    @IBOutlet weak var tfBirthPlace: UITextField!
    @IBOutlet weak var tfDOB: UITextField!
    @IBOutlet weak var accountSwitch: UISwitch!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var chooseBuuton: UIButton!
    
    //MARK: ViewController LifeCycleMethods-->>
    //MARK: ---
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.title = "SIGN UP"
    }
}

//MARK: IBActions-->>
//MARK: ---
extension SignUPVC {
    @IBAction func photoUploadBtn(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            print("Button capture")
            
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func accSwitch(_ sender: UISwitch) {
        
    }
    
    @IBAction func signUpBtn(_ sender: UIButton) {
        
        if tfUserName.text != "" && tfPhoneNo.text != "" && tfEmail.text != "" && tfDOB.text != ""
            
        {
            
            let myStoryborad = UIStoryboard(name: "Main", bundle: nil)
            
            let vc = myStoryborad.instantiateViewController(withIdentifier: "HomeVC") as? HomeVC
            
            self.navigationController?.pushViewController(vc!, animated: true)
            
        }
        
    }
    
}


extension SignUPVC: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
        self.dismiss(animated: true, completion: { () -> Void in
            
        })
        
        imageView.image = image
    }
}
