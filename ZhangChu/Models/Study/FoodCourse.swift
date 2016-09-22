//
//  FoodCourse.swift
//  ZhangChu
//
//  Created by myappleair on 16/8/18.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit

class FoodCourse: NSObject
{
    
    var charge_count: Int?

    var episode_sum: Int?

    var series_id: Int?

    var series_name: String?

    var image: String?

    var album_logo: String?

    var album: String?

    var episode: Int?

    var tag: String?

    var play: Int?
    init(dict: [String: AnyObject])
    {
        super.init()
        charge_count = dict["charge_count"] as? Int
        episode_sum = dict["episode_sum"] as? Int
        series_id = dict["series_id"] as? Int
        series_name = dict["series_name"] as? String
        image = dict["image"] as? String
        album_logo = dict["album_logo"] as? String
        album = dict["album"] as? String
        episode = dict["episode"] as? Int
        tag = dict["tag"] as? String
        play = dict["play"] as? Int
        
    }

}
