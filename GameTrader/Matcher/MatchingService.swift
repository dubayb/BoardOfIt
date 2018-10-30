//
//  MatchingService.swift
//  GameTrader
//
//  Created by Bryan Dubay on 10/4/18.
//  Copyright © 2018 Bryan Dubay. All rights reserved.
//

import Foundation
import FirebaseFirestore
class Matcher: NSObject {
    static let shared = Matcher()
    var matchedUserNames = [String]()
    
    func configureMatchesWithGeofireReferences(usersNearby:CollectionReference, completion:@escaping ([String],[[[DataBaseGameItem]]])->Void) {
        
        let group = DispatchGroup()
        var usersGamesCollections = [[[DataBaseGameItem]]]()
        var nearbyUserNames = [String]()
        usersNearby.addSnapshotListener { (snap, error) in
            for doc in snap!.documents {
                 guard doc.documentID != DataBaseShared.currentUser?.uid else { continue }
                print(doc.documentID)
                print(doc.data())
                nearbyUserNames.append(doc.data()["BGGUserName"] as? String ?? "")
                let dbUserRef = DataBaseShared.db.collection(FirebaseConstants.usersCollection.rawValue).document(doc.documentID)
                let nearbyUsersGames = dbUserRef.collection("games")
                group.enter()
               
                self.getGamesOfUsers(gamesCollectionReference: nearbyUsersGames) { gameItems in
                    
                    usersGamesCollections.append(gameItems)
                    group.leave()
                }
            }
            group.notify(queue: .main, execute: {
                completion(nearbyUserNames,usersGamesCollections)
            })
        }
    }
    
    
    
    func getGamesOfUsers(gamesCollectionReference:CollectionReference,completion: @escaping ( [[DataBaseGameItem]] )->Void) {
        gamesCollectionReference.getDocuments(completion: { (snap, error) in
            
            var forTrade = [DataBaseGameItem]()
            var wants = [DataBaseGameItem]()
            for doc in snap!.documents {
                
                let fortrade = doc.data()["forTrade"] as! Bool
                if fortrade {
                    forTrade.append(DataBaseGameItem.init(name: doc.documentID, gameStatus: .forTrade, imageUrl: doc.data()["imageUrl"] as! String))
                } else {
                    wants.append(DataBaseGameItem.init(name: doc.documentID, gameStatus: .wants, imageUrl: doc.data()["imageUrl"] as! String))
                }
            }
            completion( [forTrade,wants])
        })
    }
    
}
