//
//  EmployeeCommetsVC.swift
//  iOSAssessment-13
//
//  Created by Satyam Dixit on 18/10/21.
//

import UIKit

///Following Codable Protocol
///
struct EmployeeComments: Codable {
    var id: Int?
    var title: String?
    var body: String?
    
    ///Adding CodingKeys enum
    ///
    enum CodingKeys: String, CodingKey {
        case id
        case title = "title"
        case body = "body"
    }
    
}

///Adding EmployeesJSONData struct
///
struct EmployeesCpmmentsJSONData: Codable {
    var data: [EmployeeComments]
}



class EmployeeCommetsVC: UIViewController {
    
    @IBOutlet weak var demoPostApiTableView: UITableView!
    
    var posts: [EmployeeComments] = [] {
        didSet{
            DispatchQueue.main.async {
                self.demoPostApiTableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func apiDemoForGET() {
        // ToDo: get the results from network
        NetworkManager.shared.request() { (responseData, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            else {
                if let employees = responseData as? [EmployeeComments] {
                    self.posts = employees
                }
            }
        }
        
    }
    
}
