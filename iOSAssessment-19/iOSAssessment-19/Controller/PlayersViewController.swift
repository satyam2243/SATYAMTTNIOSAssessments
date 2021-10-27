//
//  PlayersViewController.swift
//  iOSAssessment-19
//
//  Created by Satyam Dixit on 27/10/21.
//

import UIKit

class PlayersViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var playerInfoTableView: UITableView!
    
    
    //MARK: - Properties
    

    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTableView()
    }
    
    //MARK: - IBActions
    //MARK: - Methods
    
    private func setUpTableView() {
        playerInfoTableView.delegate = self
        playerInfoTableView.dataSource = self
    }
    
}


//MARK: - UitableView Delegate and dataSource in ViewController's Extension

extension PlayersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let dataCount = PlayersData.sharedInstance.playersDataArray.count
        return dataCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = playerInfoTableView.dequeueReusableCell(withIdentifier: "PlayersTableViewCell") as? PlayersTableViewCell {
            let data = PlayersData.sharedInstance.playersDataArray[indexPath.row]
            
            cell.playerName.text = data.name
            cell.playerSport.text = data.sport
            cell.playerEmail.text = data.email
            
            return cell
        }
        
        return UITableViewCell()
    }

    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Players List"
    }
    
}
