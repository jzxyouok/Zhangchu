//
//  Shop.swift
//  ZhangChu
//
//  Created by myappleair on 16/8/17.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit

class Shop: NSObject
{
    
    var visualCodeList: [Visualcodelist]?

    var imageList: [Imagelist]?

    var useVoucher: Bool?

    var commodityDesc: String?

    var intro: String?

    var postage: Int?

    var streetPrice: Int?

    var sellerDesc: String?

    var name: String?

    var totalQty: Int?

    var buyLimit: Int?

    var commodityType: Commoditytype?

    var id: Int?

    var backgroundImage: String?

    var isVirtual: Bool?

    var leftQty: Int?

    var saleOff: Int?

    var sales: Int?

    var promotionDesc: String?

    var price: Int?

    var saleOn: Int?
    init(dict: [String: AnyObject])
    {
        super.init()
        useVoucher = dict["useVoucher"] as? Bool
        commodityDesc = dict["commodityDesc"] as? String
        intro = dict["intro"] as? String
        postage = dict["postage"] as? Int
        streetPrice = dict["streetPrice"] as? Int
        sellerDesc = dict["sellerDesc"] as? String
        name = dict["name"] as? String
        totalQty = dict["totalQty"] as? Int
        buyLimit = dict["buyLimit"] as? Int
        id = dict["id"] as? Int
        backgroundImage = dict["backgroundImage"] as? String
        isVirtual = dict["isVirtual"] as? Bool
        leftQty = dict["leftQty"] as? Int
        saleOff = dict["saleOff"] as? Int
        sales = dict["sales"] as? Int
        promotionDesc = dict["promotionDesc"] as? String
        price = dict["price"] as? Int
        saleOn = dict["saleOn"] as? Int
    }

}
class Commoditytype: NSObject
{

    var id: Int?

    var isLeaf: Bool?

    var name: String?

    var parentId: Int?
    init(dict: [String: AnyObject])
    {
        super.init()
        id = dict["id"] as? Int
        isLeaf = dict["isLeaf"] as? Bool
        name = dict["name"] as? String
        parentId = dict["parentId"] as? Int
    }

}

class Visualcodelist: NSObject
{

    var commodityId: Int?

    var code: String?
    init(dict: [String: AnyObject])
    {
        super.init()
        commodityId = dict["commodityId"] as? Int
        code = dict["code"] as? String
    }

}

class Imagelist: NSObject
{

    var image: String?

    var commodityId: Int?
    init(dict: [String: AnyObject])
    {
        super.init()
        image = dict["image"] as? String
        commodityId = dict["commodityId"] as? Int
    }

}

