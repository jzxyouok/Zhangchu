//
//  SceneInfo.swift
//  ZhangChu
//
//  Created by sword on 16/8/29.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit

class SceneInfo: NSObject {
    
    var dishes_desc : String?
    
    var dishes_id : Int?
    
    var dishes_name: String?
    
    var image: String?
    
    var like: Int?
    
    var material_video : String?
    
    var process_video: String?
    
    var tag_info = [TagInfo]()
    
    init(dict:[String : AnyObject]) {
        
        dishes_desc = dict["dishes_desc"] as? String
        
        dishes_id = dict["dishes_id"] as? Int
        
        dishes_name = dict["dishes_name"] as? String
        
        image = dict["image"] as? String
        
        like = dict["like"] as? Int
        
        material_video = dict["material_video"] as? String
        
        process_video = dict["process_video"] as? String
        
        if let array = dict["tags_info"] as? [AnyObject] {
            
            for item in array {
                
                
                let tag = TagInfo(dict: item as![String : AnyObject])
                
                self.tag_info.append(tag)
            }
            
        }
        
        
        
        
    }
    

}

class TagInfo: NSObject {
    var id : Int?
    
    var text : String?
    
    var type : Int?
    
    init(dict:[String: AnyObject]) {
        
        
        id = dict["id"] as? Int
        
        text = dict["text"] as? String
        
        type = dict["type"] as? Int
    }
    
    
}
