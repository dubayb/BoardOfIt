//
//  NotificationCenterExtension.swift
//  GameTrader
//
//  Created by Bryan Dubay on 10/5/18.
//  Copyright © 2018 Bryan Dubay. All rights reserved.
//

import Foundation
extension Notification.Name {
    static var onBoardingFinished: Notification.Name {
        return .init(rawValue: "onBoardingFinished")
    }
    static var nearbyUsersFound: Notification.Name {
        return .init(rawValue: "nearbyUsersFound")
    }
    static var clickedAGame: Notification.Name {
        return .init("clickedAGame")
    }
}
