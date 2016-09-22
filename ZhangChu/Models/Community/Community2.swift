//
//  Community2.swift
//  ZhangChu
//
//  Created by myappleair on 16/8/17.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit

class Community2: NSObject
{
    
    var topic_id: String?
    
    var post_id: String?
    
    var id: String?
    
    var locx: Int?
    
    var width: Int?
    
    var topic_name: String?
    
    var locy: Int?

    var comment: [String]?

    var like: [String]?

    var agree_count: String?

    var user_id: String?

    var image: String?

    var head_img: String?

    var create_time: String?

    var video: String?

    var share_url: String?

    var delete_time: String?

    //var id: String?

    var nick: String?

    var belike: Int?

    var marrow_time: String?

    var create_time_org: Int?

    var istalent: Int?

    var comment_count: String?

    var content: String?

    var descri: String?
    init(dict: [String: AnyObject])
    {
        super.init()
        topic_id = dict["topic_id"] as? String
        post_id = dict["post_id"] as? String
        id = dict["id"] as? String
        locx = dict["locx"] as? Int
        width = dict["width"] as? Int
        topic_name = dict["topic_name"] as? String
        locy = dict["locy"] as? Int
        comment = dict["comment"] as? [String]
        like = dict["like"] as? [String]
        agree_count = dict["agree_count"] as? String
        user_id = dict["user_id"] as? String
        image = dict["image"] as? String
        head_img = dict["head_img"] as? String
        create_time = dict["create_time"] as? String
        video = dict["video"] as? String
        share_url = dict["share_url"] as? String
        delete_time = dict["delete_time"] as? String
        nick = dict["nick"] as? String
        belike = dict["belike"] as? Int
        marrow_time = dict["marrow_time"] as? String
        create_time_org = dict["create_time_org"] as? Int
        istalent = dict["istalent"] as? Int
        comment_count = dict["comment_count"] as? String
        content = dict["content"] as? String
        descri = dict["description"] as? String
        
    }

}

