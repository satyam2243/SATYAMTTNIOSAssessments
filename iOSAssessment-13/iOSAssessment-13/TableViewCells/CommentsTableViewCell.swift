//
//  CommentsTableViewCell.swift
//  iOSAssessment-13
//
//  Created by satyam dixit on 21/10/21.
//

import UIKit

class CommentsTableViewCell: UITableViewCell {

    @IBOutlet weak var userId: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var comment: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
