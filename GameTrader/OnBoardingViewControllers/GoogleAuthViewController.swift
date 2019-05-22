//
//  GoogleAuthViewController.swift
//  GameTrader
//
//  Created by Bryan Dubay on 9/25/18.
//  Copyright © 2018 Bryan Dubay. All rights reserved.
//

import UIKit

import GoogleSignIn
import FirebaseAuth
import FirebaseCore
import FirebaseUI

class GoogleAuthViewController: UIViewController , FUIAuthDelegate  {
    var successfulAndDismiss: (() -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true
        
        // You need to adopt a FUIAuthDelegate protocol to receive callback
        let providers: [FUIAuthProvider] = [
            FUIGoogleAuth()
        ]
        let authUI = FUIAuth.defaultAuthUI()
        authUI?.providers = providers
        authUI?.delegate = self
        
    }

    @IBAction func signIn(_ sender: UIButton) {
        let authUI = FUIAuth.defaultAuthUI()
        if let authViewController = authUI?.authViewController() {
           self.present(authViewController, animated: true, completion: nil)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?) {
        // handle user and error as necessary
        if let er = error {
            self.showErrorAlert(errorTitle: er.localizedDescription)           
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let locationAuth = storyboard.instantiateViewController(withIdentifier: "LocationPermissionViewController") as! LocationPermissionViewController
            UserDataBaseService.shared.addUserToDB(user:user)
            self.navigationController?.pushViewController(locationAuth, animated: true)
        }
    }
    func authUI(_ authUI: FUIAuth, didFinish operation: FUIAccountSettingsOperationType, error: Error?) {
        print(error?.localizedDescription ?? "")
    }
    
}
