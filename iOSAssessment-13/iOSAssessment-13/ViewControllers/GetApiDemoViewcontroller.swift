//
//  ViewController.swift
//  iOSAssessment-13
//
//  Created by Satyam Dixit on 18/10/21.
//

import UIKit

///Following Codable Protocol
///
struct EmployeePosts: Codable {
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
struct EmployeesPostsJSONData: Codable {
    var data: [EmployeePosts]
}


class GetApiDemoViewcontroller: UIViewController {

    @IBOutlet weak var demoTableView: UITableView!
    
    var posts: [EmployeePosts] = [] {
        didSet{
            DispatchQueue.main.async {
                self.demoTableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        apiDemoForGET()
        
    }
    
    @IBAction func addCommentsForm(_ sender: UIBarButtonItem) {
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        
        let vc = storyboard.instantiateViewController(withIdentifier: "AddCommentsVC") as? AddCommentsVC
        
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    
    func apiDemoForGET() {
        // ToDo: get the results from network
        NetworkManager.shared.request() { (responseData, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            else {
                if let employees = responseData as? [EmployeePosts] {
                    self.posts = employees
                }
            }
        }
        
    }
    
    
}

extension GetApiDemoViewcontroller: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? EmployeePostsTableViewCell{
            
            cell.postNumber?.text = "Post NO. -  \(posts[indexPath.row].id ?? 0)"
            
            cell.postTitle?.text = "Title - \(posts[indexPath.row].title ?? "n/a")"
            
            cell.postBody?.text = "Post - \(posts[indexPath.row].body ?? "n/a")"
            
            return cell
        }
        return UITableViewCell()
    }
}


