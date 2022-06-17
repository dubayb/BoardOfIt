

import Foundation
struct Msrps : Codable {
	let country : String?
	let price : Int?

	enum CodingKeys: String, CodingKey {

		case country = "country"
		case price = "price"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		country = try values.decodeIfPresent(String.self, forKey: .country)
		price = try values.decodeIfPresent(Int.self, forKey: .price)
	}

}
