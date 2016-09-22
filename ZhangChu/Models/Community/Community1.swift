//
//  Community1.swift
//  ZhangChu
//
//  Created by myappleair on 16/8/17.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit

class Community1: NSObject
{
    
    var id: String?

    var content: String?

    var descri: String?

    var image: String?

    var video: String?
    init(dict: [String: AnyObject])
    {
        super.init()
        id = dict["id"] as? String
        content = dict["content"] as? String
        descri = dict["description"] as? String
        image = dict["image"] as? String
        video = dict["video"] as? String
        
    }


}
