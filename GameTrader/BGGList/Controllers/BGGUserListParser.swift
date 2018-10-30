//
//  BGGUserListParser.swift
//  GameTrader
//
//  Created by Bryan Dubay on 10/30/18.
//  Copyright © 2018 Bryan Dubay. All rights reserved.
//

import Foundation

protocol BGGUserListParser {
    func parseGamesList(gamesList:[BGGUserList]) -> MultipleTypesViewModel
}
extension BGGUserListParser {
    func parseGamesList(gamesList:[BGGUserList]) -> MultipleTypesViewModel {
        //Local Games list 
        var owns = [ViewItem]()
        var wants = [ViewItem]()
        
        let dbUserRef = DataBaseShared.db.collection(FirebaseConstants.usersCollection.rawValue).document(DataBaseShared.currentUser!.uid)
        //Database Games list
        let batch = DataBaseShared.db.batch()
        batch.setData([:], forDocument: dbUserRef)
        //make the decodable into view items
        for boardGame in gamesList {
            
            guard let name = boardGame.name , let image = boardGame.thumbnail , let forTrade = boardGame.forTrade , let want = boardGame.want else { continue }
            
            let newGameName = name.replacingOccurrences(of: "/", with: "")
            
            let agameRef = dbUserRef.collection("games").document(newGameName)
            
            if forTrade {
                batch.setData([ "imageUrl": image, "forTrade":true, "wants":false], forDocument: agameRef)
                owns.append(BGGUserListItem.init(name: name, imageUrl: image, gameStatus: .forTrade ))
            }
            if want {
                batch.setData([ "imageUrl": image, "forTrade":false, "wants":true], forDocument: agameRef)
                wants.append(BGGUserListItem.init(name: name, imageUrl: image, gameStatus: .wants  ))
            }
        }
        batch.commit { (error) in
            //            print(String(describing: error?.localizedDescription))
        }
        return MultipleTypesViewModel.init(items:[[owns,wants]], headers: ["",""])
    }
}
