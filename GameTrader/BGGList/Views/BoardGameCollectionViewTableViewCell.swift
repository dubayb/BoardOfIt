//
//  BoardGameCollectionViewTableViewCell.swift
//  GameTrader
//
//  Created by Bryan Dubay on 9/28/18.
//  Copyright © 2018 Bryan Dubay. All rights reserved.
//

import UIKit
import SDWebImage

class BoardGameCollectionViewTableViewCell: UITableViewCell , ReusableCell {
    @IBOutlet weak var forTradeOrWants: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    var items: [ViewItem]? {
        didSet {
            switch items![0].gameStatus {
            case .forTrade:
                forTradeOrWants.text = "For Trade"
            case .wants:
                forTradeOrWants.text = "Wants"
            }
           collectionView.reloadData()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        //register collection cell
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let nib = UINib(nibName: "BoardGameCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "BoardGameCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
extension BoardGameCollectionViewTableViewCell : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BoardGameCollectionViewCell", for: indexPath) as! BoardGameCollectionViewCell
        
        if let item = items?[indexPath.item] {
            cell.item = item
        }

        return cell
    }
    
}

//what happens on click
extension BoardGameCollectionViewTableViewCell : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let items = items else {return}
            //segue
        let item = items[indexPath.item]
        print(item.name)
        NotificationCenter.default.post(name: .clickedAGame, object: item)
        
    }
}
extension BoardGameCollectionViewTableViewCell : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        
        let size = CGSize(width: bounds.width / 3, height: bounds.height / 4)
        
        return size
    }
}
