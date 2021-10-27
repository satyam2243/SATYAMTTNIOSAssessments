//
//  PlayersTableViewCell.swift
//  iOSAssessment-19
//
//  Created by Satyam Dixit on 27/10/21.
//

import UIKit

class PlayersTableViewCell: UITableViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerSport: UILabel!
    @IBOutlet weak var playerEmail: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureCell(item: PlayersModel) {
        self.playerName.text = item.name
        self.playerSport.text = item.sport
        self.playerEmail.text = item.email
    }
}
