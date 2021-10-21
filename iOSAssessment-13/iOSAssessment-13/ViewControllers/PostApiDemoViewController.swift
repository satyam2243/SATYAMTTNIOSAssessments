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
    var name: String?
    var email: String?
    var comment: String?
    
    ///Adding CodingKeys enum
    ///
    enum CodingKeys: String, CodingKey {
        case id
        case name = "name"
        case email = "email"
        case comment = "body"
    }
    
}

///Adding EmployeesJSONData struct
///
struct EmployeesCpmmentsJSONData: Codable {
    var data: [EmployeeComments]
}



class PostApiDemoViewController: UIViewController {
    
    @IBOutlet weak var demoPostApiTableView: UITableView!
    
    var comments: [EmployeeComments] = [] {
        didSet{
            DispatchQueue.main.async {
                self.demoPostApiTableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        apiDemoForPOST()
    }
    
    func apiDemoForPOST() {
        // ToDo: get the results from network
        NetworkManager.shared.requestComment { response, error in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                if let usersComments = response as? [EmployeeComments] {
                    self.comments = usersComments
                }
            }
        }
    }
    
    
}

extension PostApiDemoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CommentsTableViewCell") as? CommentsTableViewCell{
            
            cell.userId?.text = "userID. -  \(comments[indexPath.row].id ?? 0)"
            
            cell.userName?.text = "UserName - \(comments[indexPath.row].name ?? "n/a")"
            
            cell.userEmail?.text = "Email - \(comments[indexPath.row].email ?? "n/a")"
            cell.comment?.text = "Comment - \(comments[indexPath.row].comment ?? "n/a")"
            return cell
        }
        return UITableViewCell()
    }
}

