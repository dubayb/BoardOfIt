//
//  MultipleTypesViewModel.swift
//  Reusable
//
//  Created by Bryan Dubay on 9/19/18.
//  Copyright © 2018 Bryan Dubay. All rights reserved.
//

import Foundation
import UIKit

class MultipleTypesViewModel: NSObject {
    var items: [[[ViewItem]]]!
    var headers: [String]!
    init(items:[[[ViewItem]]],headers:[String]) {
        super.init()
        self.headers = headers
        self.items = items
    }
}

extension MultipleTypesViewModel : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rowItem = items[indexPath.section][indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: BoardGameCollectionViewTableViewCell.reuseIdentifier, for: indexPath) as! BoardGameCollectionViewTableViewCell
        
        cell.items = rowItem
        
        return cell

    }
    // TODO: Create Interactive headers that will bring up message dialog.
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headers[section]
    }
    
}

extension MultipleTypesViewModel : UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}

