/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Games : Codable {
	let id : String?
	let handle : String?
	let url : String?
	let edit_url : String?
	let name : String?
	let price : String?
	let price_ca : String?
	let price_uk : String?
	let price_au : String?
	let msrp : Int?
	let msrps : [Msrps]?
	let discount : String?
	let year_published : Int?
	let min_players : Int?
	let max_players : Int?
	let min_playtime : Int?
	let max_playtime : Int?
	let min_age : Int?
	let description : String?
	let commentary : String?
	let faq : String?
	let thumb_url : String?
	let image_url : String?
	let matches_specs : String?
	let specs : [String]?
	let mechanics : [Mechanics]?
	let categories : [Categories]?
	let publishers : [Publishers]?
	let designers : [Designers]?
	let primary_publisher : Primary_publisher?
	let primary_designer : Primary_designer?
	let developers : [String]?
	let related_to : [String]?
	let related_as : [String]?
	let artists : [String]?
	let names : [String]?
	let rules_url : String?
	let amazon_rank : Int?
	let official_url : String?
	let sell_sheet_url : String?
	let store_images_url : String?
	let comment_count : Int?
	let num_user_ratings : Int?
	let average_user_rating : Double?
	let size_height : Double?
	let historical_low_prices : [Historical_low_prices]?
	let active : Bool?
	let num_user_complexity_votes : Int?
	let average_learning_complexity : Double?
	let average_strategy_complexity : Double?
	let visits : Int?
	let lists : Int?
	let mentions : Int?
	let links : Int?
	let plays : Int?
	let rank : Int?
	let type : String?
	let sku : String?
	let upc : String?
	let isbn : String?
	let video_links : [String]?
	let availability_status : String?
	let num_distributors : Int?
	let trending_rank : Int?
	let listing_clicks : Int?
	let is_historical_low : Bool?
	let skus : [String]?
	let sku_objects : [Sku_objects]?
	let players : String?
	let playtime : String?
	let msrp_text : String?
	let price_text : String?
	let tags : [String]?
	let images : Images?
	let description_preview : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case handle = "handle"
		case url = "url"
		case edit_url = "edit_url"
		case name = "name"
		case price = "price"
		case price_ca = "price_ca"
		case price_uk = "price_uk"
		case price_au = "price_au"
		case msrp = "msrp"
		case msrps = "msrps"
		case discount = "discount"
		case year_published = "year_published"
		case min_players = "min_players"
		case max_players = "max_players"
		case min_playtime = "min_playtime"
		case max_playtime = "max_playtime"
		case min_age = "min_age"
		case description = "description"
		case commentary = "commentary"
		case faq = "faq"
		case thumb_url = "thumb_url"
		case image_url = "image_url"
		case matches_specs = "matches_specs"
		case specs = "specs"
		case mechanics = "mechanics"
		case categories = "categories"
		case publishers = "publishers"
		case designers = "designers"
		case primary_publisher = "primary_publisher"
		case primary_designer = "primary_designer"
		case developers = "developers"
		case related_to = "related_to"
		case related_as = "related_as"
		case artists = "artists"
		case names = "names"
		case rules_url = "rules_url"
		case amazon_rank = "amazon_rank"
		case official_url = "official_url"
		case sell_sheet_url = "sell_sheet_url"
		case store_images_url = "store_images_url"
		case comment_count = "comment_count"
		case num_user_ratings = "num_user_ratings"
		case average_user_rating = "average_user_rating"
		case size_height = "size_height"
		case historical_low_prices = "historical_low_prices"
		case active = "active"
		case num_user_complexity_votes = "num_user_complexity_votes"
		case average_learning_complexity = "average_learning_complexity"
		case average_strategy_complexity = "average_strategy_complexity"
		case visits = "visits"
		case lists = "lists"
		case mentions = "mentions"
		case links = "links"
		case plays = "plays"
		case rank = "rank"
		case type = "type"
		case sku = "sku"
		case upc = "upc"
		case isbn = "isbn"
		case video_links = "video_links"
		case availability_status = "availability_status"
		case num_distributors = "num_distributors"
		case trending_rank = "trending_rank"
		case listing_clicks = "listing_clicks"
		case is_historical_low = "is_historical_low"
		case skus = "skus"
		case sku_objects = "sku_objects"
		case players = "players"
		case playtime = "playtime"
		case msrp_text = "msrp_text"
		case price_text = "price_text"
		case tags = "tags"
		case images = "images"
		case description_preview = "description_preview"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		handle = try values.decodeIfPresent(String.self, forKey: .handle)
		url = try values.decodeIfPresent(String.self, forKey: .url)
		edit_url = try values.decodeIfPresent(String.self, forKey: .edit_url)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		price = try values.decodeIfPresent(String.self, forKey: .price)
		price_ca = try values.decodeIfPresent(String.self, forKey: .price_ca)
		price_uk = try values.decodeIfPresent(String.self, forKey: .price_uk)
		price_au = try values.decodeIfPresent(String.self, forKey: .price_au)
		msrp = try values.decodeIfPresent(Int.self, forKey: .msrp)
		msrps = try values.decodeIfPresent([Msrps].self, forKey: .msrps)
		discount = try values.decodeIfPresent(String.self, forKey: .discount)
		year_published = try values.decodeIfPresent(Int.self, forKey: .year_published)
		min_players = try values.decodeIfPresent(Int.self, forKey: .min_players)
		max_players = try values.decodeIfPresent(Int.self, forKey: .max_players)
		min_playtime = try values.decodeIfPresent(Int.self, forKey: .min_playtime)
		max_playtime = try values.decodeIfPresent(Int.self, forKey: .max_playtime)
		min_age = try values.decodeIfPresent(Int.self, forKey: .min_age)
		description = try values.decodeIfPresent(String.self, forKey: .description)
		commentary = try values.decodeIfPresent(String.self, forKey: .commentary)
		faq = try values.decodeIfPresent(String.self, forKey: .faq)
		thumb_url = try values.decodeIfPresent(String.self, forKey: .thumb_url)
		image_url = try values.decodeIfPresent(String.self, forKey: .image_url)
		matches_specs = try values.decodeIfPresent(String.self, forKey: .matches_specs)
		specs = try values.decodeIfPresent([String].self, forKey: .specs)
		mechanics = try values.decodeIfPresent([Mechanics].self, forKey: .mechanics)
		categories = try values.decodeIfPresent([Categories].self, forKey: .categories)
		publishers = try values.decodeIfPresent([Publishers].self, forKey: .publishers)
		designers = try values.decodeIfPresent([Designers].self, forKey: .designers)
		primary_publisher = try values.decodeIfPresent(Primary_publisher.self, forKey: .primary_publisher)
		primary_designer = try values.decodeIfPresent(Primary_designer.self, forKey: .primary_designer)
		developers = try values.decodeIfPresent([String].self, forKey: .developers)
		related_to = try values.decodeIfPresent([String].self, forKey: .related_to)
		related_as = try values.decodeIfPresent([String].self, forKey: .related_as)
		artists = try values.decodeIfPresent([String].self, forKey: .artists)
		names = try values.decodeIfPresent([String].self, forKey: .names)
		rules_url = try values.decodeIfPresent(String.self, forKey: .rules_url)
		amazon_rank = try values.decodeIfPresent(Int.self, forKey: .amazon_rank)
		official_url = try values.decodeIfPresent(String.self, forKey: .official_url)
		sell_sheet_url = try values.decodeIfPresent(String.self, forKey: .sell_sheet_url)
		store_images_url = try values.decodeIfPresent(String.self, forKey: .store_images_url)
		comment_count = try values.decodeIfPresent(Int.self, forKey: .comment_count)
		num_user_ratings = try values.decodeIfPresent(Int.self, forKey: .num_user_ratings)
		average_user_rating = try values.decodeIfPresent(Double.self, forKey: .average_user_rating)
		size_height = try values.decodeIfPresent(Double.self, forKey: .size_height)
		historical_low_prices = try values.decodeIfPresent([Historical_low_prices].self, forKey: .historical_low_prices)
		active = try values.decodeIfPresent(Bool.self, forKey: .active)
		num_user_complexity_votes = try values.decodeIfPresent(Int.self, forKey: .num_user_complexity_votes)
		average_learning_complexity = try values.decodeIfPresent(Double.self, forKey: .average_learning_complexity)
		average_strategy_complexity = try values.decodeIfPresent(Double.self, forKey: .average_strategy_complexity)
		visits = try values.decodeIfPresent(Int.self, forKey: .visits)
		lists = try values.decodeIfPresent(Int.self, forKey: .lists)
		mentions = try values.decodeIfPresent(Int.self, forKey: .mentions)
		links = try values.decodeIfPresent(Int.self, forKey: .links)
		plays = try values.decodeIfPresent(Int.self, forKey: .plays)
		rank = try values.decodeIfPresent(Int.self, forKey: .rank)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		sku = try values.decodeIfPresent(String.self, forKey: .sku)
		upc = try values.decodeIfPresent(String.self, forKey: .upc)
		isbn = try values.decodeIfPresent(String.self, forKey: .isbn)
		video_links = try values.decodeIfPresent([String].self, forKey: .video_links)
		availability_status = try values.decodeIfPresent(String.self, forKey: .availability_status)
		num_distributors = try values.decodeIfPresent(Int.self, forKey: .num_distributors)
		trending_rank = try values.decodeIfPresent(Int.self, forKey: .trending_rank)
		listing_clicks = try values.decodeIfPresent(Int.self, forKey: .listing_clicks)
		is_historical_low = try values.decodeIfPresent(Bool.self, forKey: .is_historical_low)
		skus = try values.decodeIfPresent([String].self, forKey: .skus)
		sku_objects = try values.decodeIfPresent([Sku_objects].self, forKey: .sku_objects)
		players = try values.decodeIfPresent(String.self, forKey: .players)
		playtime = try values.decodeIfPresent(String.self, forKey: .playtime)
		msrp_text = try values.decodeIfPresent(String.self, forKey: .msrp_text)
		price_text = try values.decodeIfPresent(String.self, forKey: .price_text)
		tags = try values.decodeIfPresent([String].self, forKey: .tags)
		images = try values.decodeIfPresent(Images.self, forKey: .images)
		description_preview = try values.decodeIfPresent(String.self, forKey: .description_preview)
	}

}