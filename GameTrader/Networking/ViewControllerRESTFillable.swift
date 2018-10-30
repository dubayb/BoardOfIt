//
//  ViewControllerRESTFillable.swift
//  GameTrader
//
//  Created by Bryan Dubay on 9/20/18.
//  Copyright © 2018 Bryan Dubay. All rights reserved.
//

import Foundation
import UIKit


protocol ViewControllerRestFillable :  APIClient {
    
//    var viewModel : MultipleTypesViewModel! { get set }
    func successWithData(data: Any)
    func failureWithError(error:String)
    func getAllData()
}

extension ViewControllerRestFillable where Self : UIViewController {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    func getAllData() {
        performRequest(decodingType: T.self , route: self.route) { (result) in
            switch result {
            case .success(let value):

                self.successWithData(data: value)
            case .failure(let error):
                self.failureWithError(error: error)
            }
        }
    }
}
