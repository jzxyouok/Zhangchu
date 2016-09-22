//
//  Scenes.swift
//  ZhangChu
//
//  Created by sword on 16/8/27.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit

class Scenes: NSObject {
    
    var dish_count : Int?
    
    var is_new : Int?
    
    var scene_background : String?
    
    var scene_desc: String?
    
    var scene_id : Int?
    
    var scene_title: String?
    
    var scene_type: Int?
    
    init(dict: [String: AnyObject]) {
        
        dish_count = dict["dish_count"] as? Int
        
        is_new = dict["is_new"] as? Int
        
        scene_background = dict["scene_background"] as? String
        
        scene_desc = dict["scene_desc"] as? String
        
        scene_id = dict["scene_id"] as? Int
        
        scene_title = dict["scene_title"] as? String
        
        scene_type = dict["scene_type"] as? Int
        
    }
    
    

}
