//
//  CocoaPodDemoTableViewCell.swift
//  iOSAssessment-18
//
//  Created by satyam dixit on 26/10/21.
//

import UIKit
import SDWebImage

class CocoaPodDemoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var authorName: UILabel!
    @IBOutlet weak var authorImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    ///Configuring Cell
    func configureCell(item:Item) {
        self.authorImage.sd_setImage(with: URL(string: item.authorImage ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
        self.authorName.text = item.authorName
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
