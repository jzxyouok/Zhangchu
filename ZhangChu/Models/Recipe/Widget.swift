//
//  Widget.swift
//  ZhangChu
//
//  Created by sword on 16/8/22.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import Foundation
class Widget: NSObject {
    var desc : String?
    
    var title: String?
    
    var title_link: String?
    
    var widget_id : Int?
    
    var widget_type : Int?
    
    var widget_data = [ItemData]()
    
    init(dict: [String: AnyObject]) {
        
        desc = dict["desc"] as? String
        title = dict["title"] as? String
        
         title_link = dict["title_link"] as? String
        
        widget_id = dict["widget_id"] as? Int
        
        widget_type = dict["widget_type"] as? Int
        
        if let datas = dict["widget_data"] as? [AnyObject]{
            
            for data in datas {
                let _data = ItemData(dict: data as![String : AnyObject])
                self.widget_data.append(_data)
                
            }
        }
       // widget_data = dict["widget_data"] as? [ItemData]
    }
    
    required init?(coder aDecoder: NSCoder) {
        desc  = aDecoder.decodeObjectForKey("desc") as? String
        title = aDecoder.decodeObjectForKey("title") as? String
        title_link = aDecoder.decodeObjectForKey("title_link") as? String
        
        widget_id = aDecoder.decodeObjectForKey("widget_id") as? Int
        
        widget_type = aDecoder.decodeObjectForKey("widget_type") as? Int
        
        widget_data = (aDecoder.decodeObjectForKey("widget_data") as? [ItemData])!
        
        
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(desc, forKey: "desc")
        aCoder.encodeObject(title, forKey: "title")
        aCoder.encodeObject(title_link, forKey: "title_link")
        aCoder.encodeObject(widget_id, forKey: "widget_id")
        aCoder.encodeObject(widget_type, forKey: "widget_type")
        aCoder.encodeObject(widget_data, forKey: "widget_data")
    }
    
}