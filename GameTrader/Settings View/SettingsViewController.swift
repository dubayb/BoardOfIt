//
//  SettingsViewController.swift
//  GameTrader
//
//  Created by Bryan Dubay on 9/25/18.
//  Copyright © 2018 Bryan Dubay. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI
import FirebaseAuth

class SettingsViewController: UIViewController {

    @IBOutlet weak var location: UILabel!
    
    @IBOutlet weak var user: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let username = DataBaseShared.currentUser?.displayName {
            user.text = username
        }

        UserDataBaseService.shared.getCurrentUserDocs(completion: { (snap, error) in
            if error == nil {
                guard let location = snap?.data()?["city"] else { return }
                DispatchQueue.main.async {
                    self.location.text = location as? String
                }
            }
        })
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
