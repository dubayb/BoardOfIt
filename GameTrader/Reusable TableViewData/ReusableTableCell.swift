//
//  ReusableTableCell.swift
//  ReusableAndTestable
//
//  Created by Bryan Dubay on 9/13/18.
//  Copyright © 2018 Bryan Dubay. All rights reserved.
//

import Foundation
import UIKit

//different cell types
enum ViewType {
    case boardGame
    case match
}
enum GameStatus : String{
    case forTrade
    case wants
}
protocol ViewItem {
    
    var name : String {get}
    var type : ViewType{get}
    var imageUrl : String {get}
    var gameStatus : GameStatus {get}
    
}

public protocol ReusableCell {
    static var reuseIdentifier: String { get }
}

public extension ReusableCell where Self : UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    static var nib:UINib {
        return UINib(nibName: reuseIdentifier, bundle: nil)
    }
}

protocol ConfigurableCell: ReusableCell {
    associatedtype DataType
    
    func configure(item: DataType)
}


