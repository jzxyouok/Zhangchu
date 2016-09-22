//
//  ItemData.swift
//  ZhangChu
//
//  Created by sword on 16/8/22.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import Foundation

class ItemData: NSObject {
    
    
    var content :String?
    
    var id : Int?
    
    var link : String?
    
    var type : String?
    
        
    
    
    init(dict: [String: AnyObject]) {
        
        super.init()
        
        content = dict["content"] as? String
        
         id = dict["id"] as? Int
        
        link = dict["link"] as? String
        
        type = dict["type"] as? String
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        content = aDecoder.decodeObjectForKey("content")as? String
        id = aDecoder.decodeObjectForKey("id") as? Int
        
        link = aDecoder.decodeObjectForKey("link") as? String
        type = aDecoder.decodeObjectForKey("type") as? String
        
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(content, forKey: "content")
        aCoder.encodeObject(id, forKey: "id")
        aCoder.encodeObject(link, forKey: "link")
        aCoder.encodeObject(type, forKey: "type")
        
    }
 
   
}
