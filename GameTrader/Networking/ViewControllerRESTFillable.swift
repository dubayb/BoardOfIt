//
//  ViewControllerRESTFillable.swift
//  GameTrader
//
//  Created by Bryan Dubay on 9/20/18.
//  Copyright © 2018 Bryan Dubay. All rights reserved.
//

import Foundation
import UIKit
protocol DataFillable {
    func successWithData(data: Any)
    func failureWithError(error:String)
}

protocol ViewControllerRestFillable :  APIClient , DataFillable {
    func getAllData()
}

extension ViewControllerRestFillable where Self : UIViewController {

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
