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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imgRoundDelegate = self
        imgBorderSetDelegate = self
        greetViewSetBorderDelegate = self
        
        SetUp()
    }

    func SetUp() {
        
        self.imgRoundDelegate?.round()
        self.imgBorderSetDelegate?.setBorder()
        //self.greetViewSetBorderDelegate?.setBorder()
        
        if(detailedClientData.count > detailedEmployeeData.count) {
            for item in detailedClientData {
                self.id.text = String(item.id)
                self.name.text = item.name
                self.email.text = item.email
                self.Address.text = item.address
                self.phoneNo.text = item.phoneNumber
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
    
}

extension GreetViewController : Roundable, Bordable {
    
    func round() {
        self.img.layer.cornerRadius = self.img.layer.frame.width / 2
    }
    
    func setBorder() {
        self.img.layer.borderWidth = 3
        self.img.layer.borderColor = UIColor.blue.cgColor
    }
    
}

