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
    func performRequest(route:Router, completion:@escaping resultHandler)
}
extension APIClient {
    func performRequest(route:Router, completion: @escaping resultHandler) {
        let defaultSession = URLSession(configuration: .default)
        
        let task = defaultSession.dataTask(with: route.asURLRequest(), completionHandler: { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            do {
                if let er = error {
                    completion(Result.failure(er.localizedDescription))
                }
                if let data = data {
                    print(data)
                    let apiBase = try jsonDecoder.decode(T.self, from: data)
                    completion(Result.success(apiBase as Any))
                }
            }
            catch {
                completion(Result.failure((error.localizedDescription)))
            }
        })
        task.resume()
    }
//    private func parseData(data:Data) throws -> Any {
//        
//    }
}
public enum Result<Value> {
    case success(Value)
    case failure(String)
}
typealias resultHandler = ( Result<Any> ) -> Void
