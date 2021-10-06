//
//  ViewController.swift
//  iosAssessment-7
//
//  Created by satyam dixit on 03/10/21.
//

import UIKit

class SignUPVC: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var imagePicker = UIImagePickerController()
    
    //MARK: IBOutlets--
    //MARK:-
    @IBOutlet weak var tfUserName: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPhoneNo: UITextField!
    @IBOutlet weak var tfBirthPlace: UITextField!
    @IBOutlet weak var tfDOB: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var chooseBuuton: UIButton!
    
    //MARK: ViewController LifeCycleMethods-->>
    //MARK: ---
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        
        tfPhoneNo.delegate = self
        self.tfDOB.setInputViewDatePicker(target: self, selector: #selector(tapDone))

    }
    
    
       @objc func tapDone() {
           if let datePicker = self.tfDOB.inputView as? UIDatePicker {
               let dateformatter = DateFormatter()
               dateformatter.dateStyle = .medium
               self.tfDOB.text = dateformatter.string(from: datePicker.date)
           }
           self.tfDOB.resignFirstResponder()
       }
    
    
    // setting NavBar
      private func setupNavBar(){
          
          let navBarAppearence = UINavigationBarAppearance()
          navBarAppearence.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
          navigationController?.navigationBar.standardAppearance = navBarAppearence
          navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearence
          navigationController?.navigationBar.backIndicatorImage = UIImage(systemName: "arrow.left")
          
          navigationController?.navigationBar.layer.shadowColor = UIColor.black.cgColor
          navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
          navigationController?.navigationBar.layer.shadowRadius = 2.0
          navigationController?.navigationBar.layer.shadowOpacity = 0.5
          navigationController?.navigationBar.layer.masksToBounds = false
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
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
        self.dismiss(animated: true, completion: { () -> Void in
            
        })
        
        imageView.image = image
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



extension SignUPVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField {
            
        case tfUserName:
            tfEmail.becomeFirstResponder()
        case tfEmail:
            tfPhoneNo.becomeFirstResponder()
        case tfPhoneNo:
            tfBirthPlace.becomeFirstResponder()
        default:
            tfDOB.resignFirstResponder()
            
        }
        
        return true
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //For mobile number validation
        if textField == tfPhoneNo {
            let allowedCharacters = CharacterSet(charactersIn:"+0123456789 ")
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }
        
        if textField == tfBirthPlace {
            let allowedCharacters = CharacterSet(charactersIn:"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }
        
        return true
    }
    
}

extension UITextField {
    
    func setInputViewDatePicker(target: Any, selector: Selector) {
        // Create a UIDatePicker object and assign to inputView
        let screenWidth = UIScreen.main.bounds.width
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 216))//1
        datePicker.datePickerMode = .date //2
        // iOS 14 and above
        if #available(iOS 14, *) {// Added condition for iOS 14
          datePicker.preferredDatePickerStyle = .wheels
          datePicker.sizeToFit()
        }
        self.inputView = datePicker //3
        
        // Create a toolbar and assign it to inputAccessoryView
        let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth, height: 44.0)) //4
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil) //5
        let cancel = UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: #selector(tapCancel)) // 6
        let barButton = UIBarButtonItem(title: "Done", style: .plain, target: target, action: selector) //7
        toolBar.setItems([cancel, flexible, barButton], animated: false) //8
        self.inputAccessoryView = toolBar //9
    }
    
    @objc func tapCancel() {
        self.resignFirstResponder()
    }
    
}
