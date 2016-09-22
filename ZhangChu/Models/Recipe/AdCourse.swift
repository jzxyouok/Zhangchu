//
//  AdCourse.swift
//  ZhangChu
//
//  Created by sword on 16/8/22.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import Foundation

class AdCourse: NSObject {
    var banner_id : Int?
    
    var banner_link : String?
    
    var banner_picture: String?
    
    var banner_title: String?
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    
    
        init(dict: [String: AnyObject]) {
        
        super.init()
        
        banner_id = dict["banner_id"] as? Int
        
        banner_link = dict["banner_link"] as? String
        
        banner_picture = dict["banner_picture"] as? String
        
        banner_title = dict["banner_title"] as? String
        
    }
  
    /*
    required init?(coder aDecoder: NSCoder) {
        banner_id = aDecoder.decodeObjectForKey("banner_id") as? Int
        
        banner_link = aDecoder.decodeObjectForKey("banner_link") as? String
        
        banner_picture = aDecoder.decodeObjectForKey("banner_picture") as? String
        
        banner_title = aDecoder.decodeObjectForKey("banner_title") as? String
        
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(banner_id, forKey: "banner_id")
        aCoder.encodeObject(banner_link, forKey: "banner_link")
        aCoder.encodeObject(banner_picture, forKey: "banner_picture")
        aCoder.encodeObject(banner_title, forKey: "banner_title")
    }
 */
    
    
}
