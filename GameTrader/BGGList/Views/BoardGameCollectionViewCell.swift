//
//  BoardGameCollectionViewCell.swift
//  GameTrader
//
//  Created by Bryan Dubay on 9/28/18.
//  Copyright © 2018 Bryan Dubay. All rights reserved.
//

import UIKit
import SDWebImage

class BoardGameCollectionViewCell: UICollectionViewCell {
    
    
    var item : ViewItem! {
        didSet {
            if item.imageUrl != "" {
                 boarGameImageView!.sd_setImage(with: item.imageUrl.url, placeholderImage: UIImage(named: "bggLogo"))
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet weak var boarGameImageView: UIImageView!
    
}
