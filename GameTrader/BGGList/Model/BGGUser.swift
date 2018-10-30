//
//  BGGUser.swift
//  GameTrader
//
//  Created by Bryan Dubay on 9/20/18.
//  Copyright © 2018 Bryan Dubay. All rights reserved.
//

import Foundation
public class BGGUser : NSObject {
    static let shared = BGGUser()
    var  userName  = "" 
    func isBGGUserLoggedIn() -> Bool {
        guard let username = UserDefaults.standard.object(forKey: UserDefaultsConstants.BGGUserName.rawValue),let u = username as? String, u != "" else {
            return false
        }
        self.userName = u
        return true
    }
}
protocol UserNameObservingDelegate {
    func userNameDidChange(username:String)
}
