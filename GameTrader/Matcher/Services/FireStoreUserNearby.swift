//
//  FireStoreUserNearby.swift
//  GameTrader
//
//  Created by Bryan Dubay on 11/16/18.
//  Copyright © 2018 Bryan Dubay. All rights reserved.
//

import Foundation
import FirebaseFirestore

protocol FireStoreUserNearby : DataFillable {
    func listenToDataBaseUpdated()
}
extension FireStoreUserNearby {
    func listenToDataBaseUpdated() {
        let usersFirestoreRef = Firestore.firestore().collection(FirebaseConstants.usersCollection.rawValue)
        let geofire = GeoFirestore(collectionRef: usersFirestoreRef)
        let query = geofire.query(withCenter: LocationService.usersLocation, radius: 9)
        _ = query.observeReady {
            Matcher.shared.configureMatchesWithGeofireReferences(usersNearby: geofire.collectionRef) { ( result) in
                switch result {
                case .success(let userInfo) :
                   self.successWithData(data: userInfo)
                case .failure(let error):
                   self.failureWithError(error: error)
                }
            }
        }
    }
}
