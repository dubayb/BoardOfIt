

import Foundation
struct Publishers : Codable {
	let id : String?
	let num_games : String?
	let score : Int?
	let game : Game?
	let url : String?
	let images : Images?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case num_games = "num_games"
		case score = "score"
		case game = "game"
		case url = "url"
		case images = "images"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		num_games = try values.decodeIfPresent(String.self, forKey: .num_games)
		score = try values.decodeIfPresent(Int.self, forKey: .score)
		game = try values.decodeIfPresent(Game.self, forKey: .game)
		url = try values.decodeIfPresent(String.self, forKey: .url)
		images = try values.decodeIfPresent(Images.self, forKey: .images)
	}

}
