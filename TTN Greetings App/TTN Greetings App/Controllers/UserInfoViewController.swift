//
//  UserInfoViewController.swift
//  TTN Greetings App
//
//  Created by satyam dixit on 20/10/21.
//

import UIKit

class UserInfoViewController: UIViewController {

    @IBOutlet weak var userInfoTableView: UITableView!
    
    var employeeId = "1001"
    var userEmail: String?
    var username: String?
    var userPhone: String?
    
    var showLoggedInSuccessAlertDelegate: ShowToastProtocol?
    
    private let employeeDatabase = [
                                    Employee(email: "sat321@gmail.com", phoneNumber: "8868092243", employeeId: 101, fName: "satyam", lName: "Dixit", imageUser: "img4", userRole: "Developer", joiningDate: "10/9/2021", id: 1, address: "Etawah, U.P."),

                                    Employee(email: "gaurav321@gmail.com", phoneNumber: "9678092243", employeeId: 102, fName: "Gaurav", lName: "Bisht", imageUser: "img2", userRole: "Developer", joiningDate: "10/9/2021", id: 2, address: "Dehradun, U.K."),

                                    Employee(email: "saif321@gmail.com", phoneNumber: "8868092453", employeeId: 103, fName: "Saif", lName: "Mohd.", imageUser: "img1", userRole: "Developer", joiningDate: "10/9/2021", id: 3, address: "Lucknow, U.P."),

                                    Employee(email: "Talha321@gmail.com", phoneNumber: "8868075243", employeeId: 104, fName: "satyam", lName: "Dixit", imageUser: "img3", userRole: "Developer", joiningDate: "10/9/2021", id: 4, address: "Etawah, U.P."),

                                    Employee(email: "Chirag321@gmail.com", phoneNumber: "7668092243", employeeId: 105, fName: "Chirag", lName: "Yadav", imageUser: "img6", userRole: "Developer", joiningDate: "10/9/2021", id: 5, address: "Delhi")
                                   ]
    
    private let clientDatabse = [Clients(email: "BablooJi@ttn.com", name: "BablooJi", phoneNumber: "6346795643", image: "img2", address: "Khandala", id: 10),
                                 Clients(email: "Chirag321@ttn.com", name: "Chirag", phoneNumber: "6346795643", image: "img3", address: "Khandala", id: 11),
                                 Clients(email: "Talha321@ttn.com", name: "Talha", phoneNumber: "6346795643", image: "img4", address: "Khandala", id: 12),
                                 Clients(email: "saif321@ttn.com", name: "saif", phoneNumber: "6346795643", image: "img5", address: "Khandala", id: 13),
                                 Clients(email: "gaurav321@ttn.com", name: "gaurav", phoneNumber: "6346795643", image: "img6", address: "Etawah, U.P.", id: 14)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        showLoggedInSuccessAlertDelegate = self
        showLoggedInSuccessAlertDelegate?.showToastMsg(title: "Welcome", message: "Mr. \(username ?? "Guest") You are LoggedIn SuccessFully")
        tableViewSetup()
    }

    private func tableViewSetup(){
        userInfoTableView.delegate = self
        userInfoTableView.dataSource = self
        
        let nib1 = UINib.init(nibName: "UserInfoTableViewCell", bundle: nil)
        let nib2 = UINib.init(nibName: "ClientInfoTableViewCell", bundle: nil)
        
        userInfoTableView.register(nib1, forCellReuseIdentifier: "UserInfoTableViewCell")
        userInfoTableView.register(nib2, forCellReuseIdentifier: "ClientInfoTableViewCell")
    }
}


extension UserInfoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return clientDatabse.count
        case 2:
            return employeeDatabase.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell1 = userInfoTableView.dequeueReusableCell(withIdentifier: "UserInfoTableViewCell") as? UserInfoTableViewCell
        
        let cell2 = userInfoTableView.dequeueReusableCell(withIdentifier: "ClientInfoTableViewCell") as? ClientInfoTableViewCell
        
        switch indexPath.section {
            
        case 0:
            cell1?.employeeId.text = "ID : " + self.employeeId
            cell1?.userEmail.text = "Email : " + self.userEmail!
            cell1?.userImage.image = UIImage(named: "img1")
            cell1?.username.text = "Name : " + self.username!
            cell1?.userPhone.text = "PhoneNo. : +91" + self.userPhone!
            cell1?.UserView.layer.borderWidth = 5.0
            return cell1!
            
        case 1:
            let clientData = clientDatabse[indexPath.row]
            cell2?.clientEmail.text = "Email : " + clientData.email
            cell2?.clientname.text = "Name : " + clientData.name
            cell2?.clientPhone.text = "PhoneNo. : " + clientData.phoneNumber
            cell2?.clientImage.image = UIImage(named: "\(clientData.image)")
            cell2?.ClientAndEmployeeView.layer.backgroundColor = UIColor.lightGray.cgColor
            return cell2!
            
        case 2:
            let employeeData = employeeDatabase[indexPath.row]
            cell2?.clientEmail.text = "Email : " + employeeData.email
            cell2?.clientname.text = "Name : " + employeeData.fName
            cell2?.clientPhone.text = "PhoneNo. : " + employeeData.phoneNumber
            cell2?.clientImage.image = UIImage(named: "\(employeeData.imageUser)")
            cell2?.ClientAndEmployeeView.layer.backgroundColor = UIColor.gray.cgColor
            return cell2!
            
        default:
            return cell2!
        }

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.section {
        case 0:
            return 250
        case 1:
            return 150
        default:
            return 150
        }
    
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case 0:
            return "User's Information"
        case 1:
            return "User's Clients Information"
        case 2:
            return "User's Employees Information"
        default:
            return ""
        }
        
    }

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
            header.textLabel?.textColor = UIColor.black
            header.textLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            header.textLabel?.frame = header.bounds
            header.textLabel?.textAlignment = .center
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "GreetViewController") as? GreetViewController
        switch indexPath.section {
        case 0:
            print("datknkgnk")
            break
            
        case 1:
            vc?.detailedClientData.append(clientDatabse[indexPath.row])
            break
      
        case 2:
            vc?.detailedEmployeeData.append(employeeDatabase[indexPath.row])
            break
            
        default:
            break
                                                             
        }
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}

extension UserInfoViewController: ShowToastProtocol {
    func showToastMsg(title: String, message: String) {
        alertShow(title: title, message: message)
    }
}
