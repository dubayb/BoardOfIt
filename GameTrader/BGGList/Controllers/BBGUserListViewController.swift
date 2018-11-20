//
//  BBGUserListViewController.swift
//  GameTrader
//
//  Created by Bryan Dubay on 9/20/18.
//  Copyright © 2018 Bryan Dubay. All rights reserved.
//

import UIKit
import SDWebImage
import SDStateTableView
class BBGUserListViewController: UIViewController , BGGUserListParser{
    
    
    @IBOutlet weak var tableView: SDStateTableView!
    
    var viewModel: MultipleTypesViewModel!  {
        didSet {
            self.tableViewSetup()
            self.tableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkIfUserIsLoggedIn()
        NotificationCenter.default.addObserver(forName: .onBoardingFinished, object: nil, queue: nil) { (notification) in
            self.parseData(data: notification.object as! [BGGUserList])
        }
    }
    
    func parseData(data:[BGGUserList]) {
       
        DispatchQueue.main.async {
            //save user name
            self.displayActivityIndicator(shouldDisplay: false)
            self.logBGGUserIn()
            self.viewModel = self.parseGamesList(gamesList: data)
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    func checkIfUserIsLoggedIn() {
        if self.viewModel == nil {
            if BGGUser.shared.isBGGUserLoggedIn() {
                self.displayActivityIndicator(shouldDisplay: true)
                getAllData()
            } else {
                logBGGUserOut()
                setTableEmpty()
            }
        } 
    }
    func setTableEmpty() {
        
        tableView.setState(.withButton(errorImage: "", title: "Like Trading Board Games?", message: "", buttonTitle: "Add your games", buttonConfig: { (button) in
//            self.performSegueWithIdentifier(segueIdentifier: .ShowImportUser, sender: self)
        }, retryAction: {
            self.performSegueWithIdentifier(segueIdentifier: .ShowImportUser, sender: self)
        }))
    }
    func tableViewSetup() {
        tableView.setState(.dataAvailable)
        tableView.register(BoardGameCollectionViewTableViewCell.nib, forCellReuseIdentifier: BoardGameCollectionViewTableViewCell.reuseIdentifier)
        tableView.delegate = self.viewModel
        self.tableView.dataSource = self.viewModel
    }
    func logBGGUserIn() {
        UserDefaults.standard.set(BGGUser.shared.userName, forKey: UserDefaultsConstants.BGGUserName.rawValue)
        navigationController?.navigationBar.topItem?.title = BGGUser.shared.userName + "'s Games"
        UserDataBaseService.shared.addBGGUsernameToFirebase(user: DataBaseShared.currentUser)
        
    }
    func logBGGUserOut() {
        UserDefaults.standard.removeObject(forKey: UserDefaultsConstants.BGGUserName.rawValue)
        navigationController?.navigationBar.topItem?.title = ""
        //show logged out screen
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        SDWebImageManager.shared().cancelAll()
        SDWebImageManager.shared().imageCache?.clearMemory()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segueIdentifierForSegue(segue: segue) {
        case .ShowImportUser:
            (segue.destination as! BGGImportViewController).userNameDelegate = self
        }
    }
    
}

extension BBGUserListViewController : ViewControllerRestFillable {
    var route: Router {
        return BoardGameGeekRouter.getAllGames
    }
    
    typealias T = [BGGUserList]
    
    func successWithData(data: Any) {
        //check if empty / wrong user name
        if let gamesList = data as? [BGGUserList] {
            guard !gamesList.isEmpty else {
                self.showErrorAlert(errorTitle: "User name not registered.")
                return
            }
            self.parseData(data: gamesList)
        }
    }
    
    func failureWithError(error: String) {
        DispatchQueue.main.async {
            self.displayActivityIndicator(shouldDisplay: false)
            self.showErrorAlert(errorTitle: error)
            print(error)
        }
    }
}
extension BBGUserListViewController : UserNameObservingDelegate {
    func userNameDidChange(username: String) {
        DispatchQueue.main.async {
            self.displayActivityIndicator(shouldDisplay: true)
        }
        getAllData()
    }
}
extension BBGUserListViewController : SegueHandlerType {
    enum SegueIdentifier: String {
        case ShowImportUser
    }
}
