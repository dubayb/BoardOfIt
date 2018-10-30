//
//  NetworkRouter.swift
//  ReusableAndTestable
//
//  Created by Bryan Dubay on 9/13/18.
//  Copyright © 2018 Bryan Dubay. All rights reserved.
//

import Foundation

enum HTTPMethod : String{
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case put = "PUT"
}
protocol Router {
    
    var path :String {get}
    var method: HTTPMethod {get}
    var baseUrl : URL {get}
    var authHeader: String {get}
//    var parameters: Parameters? {get}
    func asURLRequest() -> URLRequest
    
}
extension Router  {
    
    func asURLRequest() -> URLRequest {
        let url = self.baseUrl
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Headers
        urlRequest.setValue(authHeader, forHTTPHeaderField: "Authorization")
        
        // Parameters
//        if let parameters = parameters {
//            do {
//                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
//            } catch {
//                fatalError()
//            }
//        }
        
        return urlRequest
        
    }
}

//enum Parameters : String {
//
//}

