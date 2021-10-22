//
//  UserInfoTableViewCell.swift
//  TTN Greetings App
//
//  Created by satyam dixit on 20/10/21.
//

import UIKit

class UserInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var userPhone: UILabel!
    @IBOutlet weak var employeeId: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userView: UIView!

  
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
       round(on: userImage)
    }
    
    func configureUI(){
        setBorder(on: userView)
    }
    
}


extension UserInfoTableViewCell: Roundable, Bordable {

}
