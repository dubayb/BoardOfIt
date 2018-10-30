//
//  BoardGameTableViewCell.swift
//  GameTrader
//
//  Created by Bryan Dubay on 9/20/18.
//  Copyright © 2018 Bryan Dubay. All rights reserved.
//

import UIKit
import SDWebImage

class BoardGameTableViewCell: UITableViewCell , ReusableCell {    
    

    @IBOutlet weak var GameNameLabel: UILabel!
    @IBOutlet weak var GameImageView: UIImageView!

    var item: ViewItem! {
        didSet {
            GameNameLabel.text = item.name
            if item.imageUrl != "" {
                GameImageView.sd_setImage(with: item.imageUrl.url, placeholderImage: UIImage(named: "bggLogo"))
            } else {
                print("!!!image url empty!!!")
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
