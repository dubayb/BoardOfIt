//
//  BGGImportViewController.swift
//  GameTrader
//
//  Created by Bryan Dubay on 9/20/18.
//  Copyright © 2018 Bryan Dubay. All rights reserved.
//

import UIKit
import SafariServices

class BGGImportViewController: UIViewController  {
    
    var userNameDelegate : UserNameObservingDelegate?
    
    @IBOutlet weak var BGGUserNameTF: UITextField!
    
    override func viewDidLoad() {
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        self.navigationController?.isNavigationBarHidden = true
    }
    @IBAction func BringUserToBGG(_ sender: UIButton) {
        //go to bgg.com
        self.present(SFSafariViewController.init(url: "https://www.boardgamegeek.com/".url), animated: true, completion: nil)
    }
    
    @IBAction func doneAndDismiss(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
extension BGGImportViewController : UITextFieldDelegate {
    override func resignFirstResponder() -> Bool {
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //public var user name
        if !(textField.text?.isEmpty)!{
            //display activity spinner
            self.view.endEditing(true)
            displayActivityIndicator(shouldDisplay: true)
            BGGUser.shared.userName = textField.text!
            getAllData()
            
        }
        return true
    }
}
extension BGGImportViewController : ViewControllerRestFillable {
    typealias T = [BGGUserList]
    
    var route: Router {
        return BoardGameGeekRouter.getAllGames
    }
    func failureWithError(error: String) {
        DispatchQueue.main.async {
            self.displayActivityIndicator(shouldDisplay: false)
            self.showErrorAlert(errorTitle: error)
            UserDefaults.standard.removeObject(forKey: UserDefaultsConstants.BGGUserName.rawValue)
        }
    }
    
    func successWithData(data: Any) {
        DispatchQueue.main.async { self.displayActivityIndicator(shouldDisplay: false) }
        //check if empty / wrong user name
        guard let gamesList = data as? [BGGUserList], !gamesList.isEmpty else {
            self.showErrorAlert(errorTitle: "User name not registered.")
            return
        }
        UserDefaults.standard.set(BGGUser.shared.userName, forKey: UserDefaultsConstants.BGGUserName.rawValue)
        self.userNameDelegate?.userNameDidChange(username:BGGUserNameTF.text!)
        DispatchQueue.main.async {
//            self.userNameDelegate?.userNameDidChange(username: self.BGGUserNameTF.text!)
             NotificationCenter.default.post(name: .onBoardingFinished, object: data)
            if let nav = self.navigationController {
                nav.popToRootViewController(animated: false)
            }
            
        }
    }
    
    
    
}
