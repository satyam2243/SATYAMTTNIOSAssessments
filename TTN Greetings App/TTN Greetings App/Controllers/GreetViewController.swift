//
//  GreetViewController.swift
//  TTN Greetings App
//
//  Created by satyam dixit on 20/10/21.
//

import UIKit

class GreetViewController: UIViewController {

    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var phoneNo: UILabel!
    @IBOutlet weak var Address: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var greetView: UIView!

    var detailedClientData = [Clients]()
    var detailedEmployeeData = [Employee]()
    
    var imgRoundDelegate: Roundable?
    var imgBorderSetDelegate: Bordable?
    var greetViewSetBorderDelegate: Bordable?
    var showAlertDelegate: ShowToastProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = false
        imgRoundDelegate = self
        imgBorderSetDelegate = self
        greetViewSetBorderDelegate = self
        showAlertDelegate = self
        
        SetUp()
    }

    func SetUp() {
        
        self.imgRoundDelegate?.round()
        self.imgBorderSetDelegate?.setBorder()
        //self.greetViewSetBorderDelegate?.setBorder()
        
        if(detailedClientData.count > detailedEmployeeData.count) {
            for item in detailedClientData {
                self.id.text = "EmployeeID : " + String(item.id)
                self.name.text = "Name : " + item.name
                self.email.text = "Email : " + item.email
                self.Address.text = "Address : " + item.address
                self.phoneNo.text = "PhoneNo. : " + item.phoneNumber
                self.img.image = UIImage(named: "\(item.image)")
            }
        } else {
            for item in detailedEmployeeData {
                self.id.text = "EmployeeID : " + String(item.id)
                self.name.text = "Name : " + item.fName + item.lName
                self.email.text = "Email : " + item.email
                self.Address.text = "Address : " + item.address
                self.phoneNo.text = "PhoneNo. : " + item.phoneNumber
                self.img.image = UIImage(named: "\(item.imageUser)")
            }
        }

    }
    
    @IBAction func greetUserButton(_ sender: UIBarButtonItem) {
        showAlertDelegate?.showToastMsg(title: "Greetings", message: "Welcome Mr. \(name.text ?? "Guest")")
    }
    
    @IBAction func logouButton(_ sender: UIButton) {
        UserDefaults.standard.removeObject(forKey: "username")
        UserDefaults.standard.removeObject(forKey: "useremail")
        UserDefaults.standard.removeObject(forKey: "userphone")
        UserDefaults.standard.synchronize()
        
        showAlertDelegate?.showToastMsg(title: "Hey", message: "LoggedOutSuccessFully")
        
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}

extension GreetViewController : Roundable, Bordable, ShowToastProtocol {
    
    func showToastMsg(title: String, message: String) {
       alertShow(title: title, message: message)
    }
    
    func round() {
        self.img.layer.cornerRadius = self.img.layer.frame.width / 2
    }
    
    func setBorder() {
        self.img.layer.borderWidth = 3
        self.img.layer.borderColor = UIColor.blue.cgColor
    }
    
}
