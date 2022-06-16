//
//  BoardGameAtlasModel.swift
//  GameTrader
//
//  Created by bryan dubay on 6/15/22.
//  Copyright © 2022 Bryan Dubay. All rights reserved.
//

import Foundation

struct BoardGameAtlasModel : Codable {
    let games : [Games]?
    let count : Int?

    enum CodingKeys: String, CodingKey {

        case games = "games"
        case count = "count"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        games = try values.decodeIfPresent([Games].self, forKey: .games)
        count = try values.decodeIfPresent(Int.self, forKey: .count)
    }

}
