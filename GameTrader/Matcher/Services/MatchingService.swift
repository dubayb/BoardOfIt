//
//  MatchingService.swift
//  GameTrader
//
//  Created by Bryan Dubay on 10/4/18.
//  Copyright © 2018 Bryan Dubay. All rights reserved.
//

import Foundation
import FirebaseFirestore

class Matcher: NSObject  {
    
    
    static let shared = Matcher()
    var matchedUserNames = [String]()
    
    func configureMatchesWithGeofireReferences(usersNearby:CollectionReference, completion:@escaping (Result<Any>)->Void) {
        
        let group = DispatchGroup()
        var usersGamesCollections = [[[DataBaseGameItem]]]()
        var nearbyUserNames = [String]()
        usersNearby.addSnapshotListener { (snap, error) in
            if let er = error {
                group.leave()
                completion(Result.failure(er.localizedDescription))
                
            }
            for doc in snap!.documents {
                 guard doc.documentID != DataBaseShared.currentUser?.uid else { continue }
                print(doc.documentID)
                print(doc.data())
                if let username = doc.data()["BGGUserName"] as? String {
                    //group count + 1
                    group.enter()
                    
                    nearbyUserNames.append(username)
                    print(username)
                    let dbUserRef = DataBaseShared.db.collection(FirebaseConstants.usersCollection.rawValue).document(doc.documentID)
                    let nearbyUsersGames = dbUserRef.collection("games")
                    
                    self.getGamesOfUsers(gamesCollectionReference: nearbyUsersGames) { gameItems in
                        
                        usersGamesCollections.append(gameItems)
                        //successfully found user // group count - 1
                        group.leave()
                    }
                }
                
            }
            // group count is 0 notify and return with successful with data or failure with error
            group.notify(queue: .main, execute: {
                if nearbyUserNames.isEmpty {
                    completion(Result.failure("No Users Near Current User"))
                } else {
                    completion(Result.success(["usernames":nearbyUserNames,"gameItems":usersGamesCollections]))
                }
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
