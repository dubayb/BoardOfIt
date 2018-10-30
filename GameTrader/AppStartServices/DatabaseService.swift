//
//  DatabaseService.swift
//  GameTrader
//
//  Created by Bryan Dubay on 10/1/18.
//  Copyright © 2018 Bryan Dubay. All rights reserved.
//
import FirebaseUI
import FirebaseFirestore
import Foundation
import Firebase
import CoreLocation
import Geofirestore

class UserDataBaseService : Servicing {
    static let shared = UserDataBaseService()
    let KFBUsersKey = FirebaseConstants.usersCollection.rawValue
    func configure() {
        //get users for map
        let settings = DataBaseShared.db.settings
        settings.areTimestampsInSnapshotsEnabled = false
        settings.isPersistenceEnabled = true
        DataBaseShared.db.settings = settings
        
    }
    // MARK: Get Data Base Properties
    func getCurrentUserDocs(completion:@escaping FIRDocumentSnapshotBlock) {
        if let user = DataBaseShared.currentUser {
            let youRef = DataBaseShared.db.collection(KFBUsersKey).document(user.uid)
            youRef.getDocument(completion: completion)
        }
    }
    // TODO: Make this distance by radius
    func getUsersNearby(state: String,completion:@escaping (_ collectionReferences:[CollectionReference])->Void) {
        var nearbyUsernames = [String]()
        var references = [CollectionReference]()
        let usersInSameState = DataBaseShared.db.collection(KFBUsersKey).whereField("state", isEqualTo: state)
        usersInSameState.getDocuments { (snap, error) in
            
            for doc in (snap?.documents)! {
                guard doc.documentID != DataBaseShared.currentUser?.uid else { continue }
                print(doc.data())
                guard let name = doc.data()["BGGUserName"] else { continue }
                nearbyUsernames.append(name as! String)
                references.append(DataBaseShared.db.collection(self.KFBUsersKey).document(doc.documentID).collection("games"))
            }
            Matcher.shared.matchedUserNames = nearbyUsernames
            completion(references)
        }
    }

    // MARK: Set Data Base Properties
    // TODO: Create batch for adding a new user.
    func addUserToDB(user:User?) {
        if let user = user {
            let dbUser = DataBaseShared.db.collection(KFBUsersKey).document(user.uid)
            print(user.displayName)
            dbUser.setData( ["name":user.displayName!], merge: true) { (error) in
//                print(error?.localizedDescription)
            }
        }
    }
    func addBGGUsernameToFirebase(user:User?) {
        if let user = user {
            let dbUser = DataBaseShared.db.collection(FirebaseConstants.usersCollection.rawValue).document(user.uid)
            dbUser.setData(["BGGUserName":BGGUser.shared.userName],merge:true) { (error) in
                if error != nil {print(String(describing: error?.localizedDescription)) }
            }
        }
    }
    
    func updateUserLocation(location:CLLocation) {
        let geoFirestoreRef = Firestore.firestore().collection(FirebaseConstants.usersCollection.rawValue)
        let geofire = GeoFirestore(collectionRef: geoFirestoreRef)
        geofire.setLocation(location: location, forDocumentWithID: (DataBaseShared.currentUser?.uid)!, completion: { (error) in
            if error != nil {
                print(error?.localizedDescription)
            }
        })
    }
    
    
//    func setCurrentUserGames(games:[[ViewItem]]) {
//        if let user = DataBaseShared.currentUser {
//            let dbUserRef = DataBaseShared.db.collection("users").document(user.uid)
//            let batch = DataBaseShared.db.batch()
//            batch.setData([:], forDocument: dbUserRef)
//            for game in games {
//                // slashes break the database calls
//                let newGameName = game.name.replacingOccurrences(of: "/", with: "")
//                
//                print(game.name)
//                switch game.gameStatus {
//                case .forTrade :
//                    let agameRef = dbUserRef.collection("games").document(newGameName)
//                    batch.setData([ "imageUrl": game.imageUrl, "forTrade":true, "wants":false], forDocument: agameRef)
//                case .wants :
//                    let agameRef = dbUserRef.collection("games").document(newGameName)
//                    batch.setData([ "imageUrl": game.imageUrl, "forTrade":false, "wants":true], forDocument: agameRef)
//                }
//            }
//            //commit batch
//            batch.commit { (error) in
//                print(String(describing: error?.localizedDescription))
//            }
//        }
//    }
}


struct DataBaseShared {
    static let db = Firestore.firestore()
    static let currentUser = Auth.auth().currentUser
    static let dbBatch = Firestore.firestore().batch()
    static let currentUserReference = DataBaseShared.db.collection(FirebaseConstants.usersCollection.rawValue).document(DataBaseShared.currentUser!.uid)
    static var geofire : GeoFirestore?
}
