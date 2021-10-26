//
//  ViewController.swift
//  iOSAssessment-18
//
//  Created by satyam dixit on 25/10/21.
//

import UIKit
import Alamofire
import NVActivityIndicatorView

class CocoaPodDemoViewController: UIViewController {
    
    //MARK: - IBOulet
    @IBOutlet weak var photoAthortableView: UITableView!
    
    //MARK: - Properties
    var arrayOfItems = [Item]()
    var activityIndicator: NVActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// starting indicator view
        setUpIndicatorView()
        activityIndicator.startAnimating()

        setupTableView()
        
        /// storing data in model
        APIClient.shared.getData { response, error, isSuccess in
            
            if let picsumData = response {
                for items in picsumData {
                    let itemUpdates = Item(authorName:  items["author"] as? String ?? "", authorImage: items["download_url"] as? String ?? "")
                    self.arrayOfItems.append(itemUpdates)
                }
                
                DispatchQueue.main.async {
                    self.photoAthortableView.reloadData()
                    self.activityIndicator.stopAnimating()
                }
            }
        }
        
        
    }
    
    //MARK: - Setup table view
    func setupTableView() {
        photoAthortableView.delegate = self
        photoAthortableView.dataSource = self
    }
    
    func setUpIndicatorView() {
        let xAxis = self.view.center.x
        let yAxis = self.view.center.y
        
        let frame = CGRect(x: (xAxis - 25), y: (yAxis - 25), width: 50, height: 50)
        activityIndicator = NVActivityIndicatorView(frame: frame)
        activityIndicator.type = .lineScale
        activityIndicator.color = UIColor.blue

        self.view.addSubview(activityIndicator)
    }
}


//MARK: - TableView Delegate and dataSource methods
extension CocoaPodDemoViewController: UITableViewDataSource,
                                      UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = photoAthortableView.dequeueReusableCell(withIdentifier: "CocoaPodDemoTableViewCell") as? CocoaPodDemoTableViewCell {
            let data = arrayOfItems[indexPath.row]
            cell.configureCell(item: data)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "CoCoaPodDemo"
    }
}

