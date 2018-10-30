//
//  APIClient.swift
//  ReusableAndTestable
//
//  Created by Bryan Dubay on 9/13/18.
//  Copyright © 2018 Bryan Dubay. All rights reserved.
//

import Foundation


protocol APIClient  {
    associatedtype T : Decodable
    var route : Router {get}
    func performRequest<T: Decodable>( decodingType: T.Type, route:Router, completion:@escaping ( Result<Any> ) -> Void )
}
extension APIClient {
    func performRequest<T: Decodable>( decodingType: T.Type, route:Router, completion:@escaping ( Result<Any> ) -> Void ) {
        let defaultSession = URLSession(configuration: .default)
        
        let task = defaultSession.dataTask(with: route.asURLRequest(), completionHandler: { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            do {
                
                if let data = data {
                    print(data)
                    let apiBase = try jsonDecoder.decode(T.self, from: data)
                    completion(Result.success(apiBase as Any))
                } else {
                    completion(Result.failure("timed out"))
                }
            }
            catch {
                completion(Result.failure(error.localizedDescription))
            }
        })
        task.resume()
    }
}
public enum Result<Value> {
    case success(Value)
    case failure(String)
}

