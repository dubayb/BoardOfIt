

import Foundation



class BGGUserListItem: NSObject , ViewItem {
    var gameStatus: GameStatus
    
    var name: String
    
    var type: ViewType {
        return .boardGame
    }
    
    var imageUrl: String
    
    init(name:String,imageUrl:String , gameStatus: GameStatus) {
        self.name = name ; self.imageUrl = imageUrl ; self.gameStatus = gameStatus
    }
    
}

struct BGGUserList : Codable {
	let gameId : Int?
	let name : String?
	let image : String?
	let thumbnail : String?
	let minPlayers : Int?
	let maxPlayers : Int?
	let playingTime : Int?
	let isExpansion : Bool?
	let yearPublished : Int?
	let bggRating : Double?
	let averageRating : Double?
	let rank : Int?
	let numPlays : Int?
	let rating : Double?
	let owned : Bool?
	let preOrdered : Bool?
	let forTrade : Bool?
	let previousOwned : Bool?
	let want : Bool?
	let wantToPlay : Bool?
	let wantToBuy : Bool?
	let wishList : Bool?
	let userComment : String?

	enum CodingKeys: String, CodingKey {

		case gameId = "gameId"
		case name = "name"
		case image = "image"
		case thumbnail = "thumbnail"
		case minPlayers = "minPlayers"
		case maxPlayers = "maxPlayers"
		case playingTime = "playingTime"
		case isExpansion = "isExpansion"
		case yearPublished = "yearPublished"
		case bggRating = "bggRating"
		case averageRating = "averageRating"
		case rank = "rank"
		case numPlays = "numPlays"
		case rating = "rating"
		case owned = "owned"
		case preOrdered = "preOrdered"
		case forTrade = "forTrade"
		case previousOwned = "previousOwned"
		case want = "want"
		case wantToPlay = "wantToPlay"
		case wantToBuy = "wantToBuy"
		case wishList = "wishList"
		case userComment = "userComment"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		gameId = try values.decodeIfPresent(Int.self, forKey: .gameId)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		image = try values.decodeIfPresent(String.self, forKey: .image)
		thumbnail = try values.decodeIfPresent(String.self, forKey: .thumbnail)
		minPlayers = try values.decodeIfPresent(Int.self, forKey: .minPlayers)
		maxPlayers = try values.decodeIfPresent(Int.self, forKey: .maxPlayers)
		playingTime = try values.decodeIfPresent(Int.self, forKey: .playingTime)
		isExpansion = try values.decodeIfPresent(Bool.self, forKey: .isExpansion)
		yearPublished = try values.decodeIfPresent(Int.self, forKey: .yearPublished)
		bggRating = try values.decodeIfPresent(Double.self, forKey: .bggRating)
		averageRating = try values.decodeIfPresent(Double.self, forKey: .averageRating)
		rank = try values.decodeIfPresent(Int.self, forKey: .rank)
		numPlays = try values.decodeIfPresent(Int.self, forKey: .numPlays)
		rating = try values.decodeIfPresent(Double.self, forKey: .rating)
		owned = try values.decodeIfPresent(Bool.self, forKey: .owned)
		preOrdered = try values.decodeIfPresent(Bool.self, forKey: .preOrdered)
		forTrade = try values.decodeIfPresent(Bool.self, forKey: .forTrade)
		previousOwned = try values.decodeIfPresent(Bool.self, forKey: .previousOwned)
		want = try values.decodeIfPresent(Bool.self, forKey: .want)
		wantToPlay = try values.decodeIfPresent(Bool.self, forKey: .wantToPlay)
		wantToBuy = try values.decodeIfPresent(Bool.self, forKey: .wantToBuy)
		wishList = try values.decodeIfPresent(Bool.self, forKey: .wishList)
		userComment = try values.decodeIfPresent(String.self, forKey: .userComment)
	}

}


