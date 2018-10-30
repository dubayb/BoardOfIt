//
//  BoardGameGeekRouter.swift
//  GameTrader
//
//  Created by Bryan Dubay on 9/20/18.
//  Copyright © 2018 Bryan Dubay. All rights reserved.
//

import Foundation
enum BoardGameGeekRouter  : Router {
    case getAllGames
    
    // MARK: - HTTPMethod
    internal var method: HTTPMethod {
        switch self {
        case .getAllGames:
            return .get
        }
    }
    internal var baseUrl: URL {
        switch self {
        case .getAllGames:
            return NetworkConstants.BoardGameGeek.baseUrl.rawValue.url
        }
        
    }
    
    // MARK: - Path
    internal var path: String {
        switch self {
        case .getAllGames:
            return BGGUser.shared.userName 

        }
    }
    internal var authHeader: String {
        switch self {
        case .getAllGames:
            return ""
        }
    }
    
    // MARK: - Parameters
//    internal var parameters: Parameters? {
//        switch self {
//        case .getAllGames:
//            return nil
//        }
//    }
}


