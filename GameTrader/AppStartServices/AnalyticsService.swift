//
//  AnalyticsService.swift
//  Reusable
//
//  Created by Bryan Dubay on 9/14/18.
//  Copyright © 2018 Bryan Dubay. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAnalytics
//import GeoFire

class AnalyticsService: NSObject ,Servicing {
    func configure() {
        FirebaseApp.configure()
        

//        Analytics.logEvent(AnalyticsEventSelectContent, parameters: [
//            AnalyticsParameterItemID: "App Launched",
//            AnalyticsParameterItemName: "",
//            AnalyticsParameterContentType: ""
//            ])
//        Analytics.setScreenName("App Launch Screen", screenClass: nil)
    }

    
}
