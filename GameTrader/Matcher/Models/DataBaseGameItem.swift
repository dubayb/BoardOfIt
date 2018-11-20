//
//  DataBaseGameItem.swift
//  GameTrader
//
//  Created by Bryan Dubay on 10/17/18.
//  Copyright © 2018 Bryan Dubay. All rights reserved.
//

import Foundation


class DataBaseGameItem: NSObject , ViewItem {
    var imageUrl: String
    
    var gameStatus: GameStatus
    
    var name: String
    
    var type: ViewType {
        return .match
    }
    
    
    init(name:String, gameStatus: GameStatus , imageUrl:String) {
        self.name = name ; self.gameStatus = gameStatus ; self.imageUrl = imageUrl
    }
    
}

