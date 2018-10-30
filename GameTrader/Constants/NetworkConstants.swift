//
//  NetworkConstants.swift
//  ReusableAndTestable
//
//  Created by Bryan Dubay on 9/13/18.
//  Copyright © 2018 Bryan Dubay. All rights reserved.
//

import Foundation

enum NetworkConstants  {
    enum BoardGameGeek : String {
        case baseUrl = "https://bgg-json.azurewebsites.net/collection/"
    }
}
enum FirebaseConstants : String {
    case usersCollection = "users"
}
extension String {
    var url: URL {
        guard let url = URL(string: self) else {
            
            fatalError("Unconstructable URL: \(self)")
        }
        return url
    }
}


//    enum ZipCodeAPI : String {
//        case apiKey = "Jrd9EHGuRHHSrmCgweOe1J2S07JzWPaThmxzial5osY7k8Fiwyhpi0GK5x4aceYL"
//        case baseUrl = "https://www.zipcodeapi.com/rest/<api_key>/"
//        case paramOne = "distance.<format>/<zip_code1>/<zip_code2>/<units>"
//    }
