//
//  EmployeePostsTableViewCell.swift
//  iOSAssessment-13
//
//  Created by Satyam Dixit on 18/10/21.
//

import UIKit

class EmployeePostsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var postNumber: UILabel!
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postBody: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
