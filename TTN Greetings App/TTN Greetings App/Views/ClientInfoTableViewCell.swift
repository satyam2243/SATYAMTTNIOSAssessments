//
//  ClientInfoTableViewCell.swift
//  TTN Greetings App
//
//  Created by satyam dixit on 20/10/21.
//

import UIKit

class ClientInfoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var clientname: UILabel!
    @IBOutlet weak var clientEmail: UILabel!
    @IBOutlet weak var clientPhone: UILabel!
    @IBOutlet weak var clientImage: UIImageView!
    @IBOutlet weak var ClientAndEmployeeView: UIView!
    
    var roundimageDelegate: Roundable?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        roundimageDelegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    override func layoutSubviews() {
        self.roundimageDelegate?.round()
    }
}

extension ClientInfoTableViewCell: Roundable {
    
    func round() {
        clientImage.layer.cornerRadius = clientImage.layer.frame.height / 2
        clientImage.layer.masksToBounds = true
    }
    
}
