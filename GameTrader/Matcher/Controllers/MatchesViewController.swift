//
//  MatchesViewController.swift
//  GameTrader
//
//  Created by Bryan Dubay on 10/4/18.
//  Copyright © 2018 Bryan Dubay. All rights reserved.
//

import UIKit
//import Geofirestore
//import FirebaseFirestore
import SDStateTableView

class MatchesViewController: UIViewController  {
    
    @IBOutlet weak var tableView: SDStateTableView!
    var viewModel : MultipleTypesViewModel? {
        didSet {
            tableView.register(BoardGameCollectionViewTableViewCell.nib, forCellReuseIdentifier: BoardGameCollectionViewTableViewCell.reuseIdentifier)
            tableView.dataSource = viewModel
            tableView.delegate = self
            DispatchQueue.main.async {
                self.displayActivityIndicator(shouldDisplay: false)
                self.tableView.reloadData()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        listenToDataBaseUpdated()
        self.navigationItem.title = "Users Near You"
        self.displayActivityIndicator(shouldDisplay: true)
        
        NotificationCenter.default.addObserver(forName: .clickedAGame, object: nil, queue: nil) { (notification) in
            if let gameItem = notification.object as? DataBaseGameItem {
                print(gameItem.name)
            }
        }
    }
    
    
    
}
extension MatchesViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let userToMatchWith = Matcher.shared.matchedUserNames[indexPath.section]
//        let gameToTalkAbout = Matcher.shared.
        
        print(userToMatchWith)
        //message this user
        //create a channel they can visit
        
    }
}
extension MatchesViewController : FireStoreUserNearby {
    
    func successWithData(data: Any) {
        let userInfo = data as! Dictionary<String, Any>
        self.viewModel = MultipleTypesViewModel.init(items: userInfo["gameItems"] as! [[[DataBaseGameItem]]], headers:userInfo["usernames"] as! [String])
    }
    
    func failureWithError(error: String) {
        print(error)
        self.displayActivityIndicator(shouldDisplay: false)
        self.tableView.setState(.withButton(errorImage: nil, title: "Sorry! There are no users near you.", message: "", buttonTitle: "Refresh", buttonConfig: { (button) in
//            self.listenToDataBaseUpdated()
        }, retryAction: {
            self.displayActivityIndicator(shouldDisplay: true)
            self.listenToDataBaseUpdated()
        }))
    }
    
}
