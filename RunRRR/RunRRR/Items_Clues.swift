//
//  Items_Clues.swift
//  RunRRR
//
//  Created by Jacky Huang on 2017/4/8.
//  Copyright © 2017年 EEECamp. All rights reserved.
//

import UIKit
class Pack: NSObject{
    var pid: Int?
    var itemClass: itemClasses?
    enum itemClasses{
        case tool
        case clue
    }
    var id: Int?
}
class Item: NSObject{
    var name: String?
    var tid: Int?
    var cid: Int?
    var pid: Int?
    var itemClass: itemClasses?
    enum itemClasses{
        case tool
        case clue
    }
    var content: String?
    var imageURL: String?
    var expireSec: Int?
    var price: Int?
}
