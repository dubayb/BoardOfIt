//
//  ViewControllerPresenter.swift
//  GameTrader
//
//  Created by Bryan Dubay on 9/20/18.
//  Copyright © 2018 Bryan Dubay. All rights reserved.
//

import Foundation
import UIKit

protocol ViewPresentable where Self:UIViewController{
    var identifier: String {get}
}
