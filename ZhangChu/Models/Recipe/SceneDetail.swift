//
//  SceneDetail.swift
//  ZhangChu
//
//  Created by sword on 16/8/30.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit

class SceneDetail: NSObject {
    
    var agreement_amount : String?
    
    var comment_count: String?
    
    var cooking_time :String?
    
    var dishes_id : String?
    
    var dishes_name: String?
    
    var dishes_title: String?
    
    var hard_level : String?
    
    var image: String?
    
    var material_desc: String?
    
    var material_video:String?
    
    var process_video: String?
    
    var taste : String?
    
    var tags_info = [TagInfo]()
    
    var step = [Step]()
    
    init(dict:[String : AnyObject]) {
       
        agreement_amount = dict["agreemet_amout"] as? String
        
        comment_count = dict["comment_count"] as? String
        
        cooking_time = dict["cooking_time"] as? String
        
        dishes_id = dict["dishes_id"] as? String
        
        dishes_name = dict["dishes_name"] as? String
        
        dishes_title = dict["dishes_title"] as? String
        
        hard_level = dict["hard_level"] as? String
        
        image = dict["image"] as? String
        
        material_desc = dict["material_desc"] as? String
        
        material_video = dict["material_video"] as? String
        
        process_video = dict["process_video"] as? String
        
        
        taste = dict["taste"] as? String
        
        if let array = dict["tags_info"] as?[AnyObject] {
            for item in array {
                
                let tag = TagInfo(dict: item as! [String : AnyObject])
                
                self.tags_info.append(tag)
            }
        }
        
        if let array = dict["step"] as? [AnyObject] {
            
            for item in array {
                
                let step = Step(dict: item as! [String : AnyObject])
                
                self.step.append(step)
            }
            
        }
        
        
    }
    

}

class Step: NSObject {
    
    var dishes_id : String?
    
    var dishes_step_desc: String?
    
    var dishes_step_id : String?
    
    var dishes_step_image:String?
    
    var dishes_step_order: String?
    
    init(dict: [String: AnyObject]) {
        
        dishes_id = dict["dishes_id"] as? String
        
        dishes_step_desc = dict["dishes_step_desc"] as? String
        
        dishes_step_id = dict["dishes_step_id"] as? String
        
        dishes_step_image = dict["dishes_step_image"] as? String
        
        dishes_step_order = dict["dishes_step_order"] as? String
        
    }
    
}
