//
//  Material.swift
//  ZhangChu
//
//  Created by sword on 16/9/1.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit

class Material: NSObject {
    
    var id : String?
    
    var image: String?
    
    var  text : String?
    
    var  data = [SubMaterial]()
    
    init(dict:[String: AnyObject]) {
       
        id = dict["id"] as? String
        
        image = dict["image"] as? String
        
        text = dict["text"] as? String
        
        if let datas = dict["data"] as? [AnyObject] {
            
            for item in datas {
                
                
                let model = SubMaterial(dict: item as! [String: AnyObject])
                
                self.data.append(model)
            }
            
            
        }
        
    }
    

}


class SubMaterial: NSObject {
    var id : String?
    
    var image : String?
    
    var text : String?
    
    init (dict:[String: AnyObject]) {
        
        id = dict["id"] as? String
        
        image = dict["image"] as? String
        
        text = dict["text"] as? String
    }
}


