//
//  MatchesViewController.swift
//  GameTrader
//
//  Created by Bryan Dubay on 10/4/18.
//  Copyright © 2018 Bryan Dubay. All rights reserved.
//

import UIKit
import Geofirestore
import FirebaseFirestore

class MatchesViewController: UIViewController  {
    
    
    @IBOutlet weak var tableView: UITableView!
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
        
        self.navigationItem.title = "Users Near You"
        self.displayActivityIndicator(shouldDisplay: true)
        listenToDataBaseUpdated()
        NotificationCenter.default.addObserver(forName: .clickedAGame, object: nil, queue: nil) { (notification) in
            if let gameItem = notification.object as? DataBaseGameItem {
                print(gameItem.name)
            }
        }
    }
    
    func listenToDataBaseUpdated() {
        let usersFirestoreRef = Firestore.firestore().collection(FirebaseConstants.usersCollection.rawValue)
        let geofire = GeoFirestore(collectionRef: usersFirestoreRef)
        let query = geofire.query(withCenter: LocationService.usersLocation, radius: 9)
        _ = query.observeReady {
            Matcher.shared.configureMatchesWithGeofireReferences(usersNearby: geofire.collectionRef) { (usernames, gameItems) in
                self.viewModel = MultipleTypesViewModel.init(items: gameItems, headers: usernames)
            }
        }
    }
    
}
    extension MatchesViewController : UITableViewDelegate {
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//            let userToMatchWith = Matcher.shared.matchedUserNames[indexPath.section]
            //message this user
        }
}
