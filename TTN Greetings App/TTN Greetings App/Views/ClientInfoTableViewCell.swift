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

    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    override func layoutSubviews() {
       
    }
    
    func configureUI(){
        setBorder(on: ClientAndEmployeeView)
        round(on: clientImage)
    }
}

extension ClientInfoTableViewCell: Roundable , Bordable{
    

}
