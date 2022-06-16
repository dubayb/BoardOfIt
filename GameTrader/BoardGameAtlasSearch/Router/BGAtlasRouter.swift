//
//  BGAtlasRouter.swift
//  GameTrader
//
//  Created by bryan dubay on 6/15/22.
//  Copyright © 2022 Bryan Dubay. All rights reserved.
//

import Foundation

enum BoardGameAtlasRouter  : Router {    
    case searchGame(query:String)
    
    // MARK: - HTTPMethod
    internal var method: HTTPMethod {
        switch self {
        case .searchGame:
            return .get
        }
    }
    internal var baseUrl: URL {
        switch self {
        case .searchGame(let query):
            return "https://api.boardgameatlas.com/api/search?name=\(query)&client_id=rgvcNXzf16".url
        }
        
    }
    
    // MARK: - Path
    internal var path: String {
        switch self {
        case .searchGame:
            return ""

        }
    }
    internal var authHeader: String {
        switch self {
        case .searchGame:
            return ""
        }
    }
    
}


