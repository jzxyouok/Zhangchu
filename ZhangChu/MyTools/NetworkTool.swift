//
//  NetworkTool.swift
//  ZhangChu
//
//  Created by myappleair on 16/8/15.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD
import SwiftyJSON

class NetworkTool: NSObject
{
    static let shareNetwork = NetworkTool()
    /// 获取首页推荐数据
    func loadHomeFirstInfo(finished:(homeItems: [HomeItem1]) -> ())
    {
        //http://api.izhangchu.com/?methodName=SystemUrl&verison=4.5
        let url = BASE_URL
        let params = ["methodName": "SystemUrl",
                      "version": "4.5"]
        Alamofire
            .request(.POST, url, parameters: params)
            .responseJSON { (response) in
                guard response.result.isSuccess else
                {
                    SVProgressHUD.showErrorWithStatus("加载失败...")
                    return
                }
                if let value = response.result.value
                {
                    let dict = JSON(value)
                    let code = dict["code"].intValue
                    let message = dict["message"].stringValue
                    guard code == RETURN_OK else {
                        SVProgressHUD.showInfoWithStatus(message)
                    return
                }
                    let data = dict["data"].dictionary
                    //  字典转成模型
                    if let items = data!["items"]?.arrayObject
                    {
                        var homeItems = [HomeItem1]()
                        for item in items {
                            let homeItem = HomeItem1(dict: item as! [String: AnyObject])
                            homeItems.append(homeItem)
                    }
                        finished(homeItems: homeItems)
                    }
            }
        }
    }
    /// 获取首页食材数据
    func loadHomeSecondInfo(finished:(homeItems: [HomeItem2]) -> ())
    {
        let url = BASE_URL
        let params = ["methodName": "MaterialSubtype",
                      "version": "4.5"]
        Alamofire
            .request(.POST, url, parameters: params)
            .responseJSON { (response) in
                guard response.result.isSuccess else
                {
                    SVProgressHUD.showErrorWithStatus("加载失败...")
                    return
                }
                if let value = response.result.value
                {
                    let dict = JSON(value)
                    let code = dict["code"].intValue
                    let message = dict["message"].stringValue
                    guard code == RETURN_OK else {
                        SVProgressHUD.showInfoWithStatus(message)
                        return
                    }
                    let data = dict["data"].dictionary
                    //  字典转成模型
                    if let items = data!["items"]?.arrayObject
                    {
                        var homeItems = [HomeItem2]()
                        for item in items {
                            let homeItem = HomeItem2(dict: item as! [String: AnyObject])
                            homeItems.append(homeItem)
                        }
                        finished(homeItems: homeItems)
                    }
                }
        }
    }
    /// 获取首页分类数据
    func loadHomeThirdInfo(finished:(homeItems: [HomeItem3]) -> ())
    {
        let url = BASE_URL
        let params = ["methodName": "CategoryIndex",
                      "version": "4.5"]
        Alamofire
            .request(.POST, url, parameters: params)
            .responseJSON { (response) in
                guard response.result.isSuccess else
                {
                    SVProgressHUD.showErrorWithStatus("加载失败...")
                    return
                }
                if let value = response.result.value
                {
                    let dict = JSON(value)
                    let code = dict["code"].intValue
                    let message = dict["message"].stringValue
                    guard code == RETURN_OK else {
                        SVProgressHUD.showInfoWithStatus(message)
                        return
                    }
                    let data = dict["data"].dictionary
                    //  字典转成模型
                    if let items = data!["items"]?.arrayObject
                    {
                        var homeItems = [HomeItem3]()
                        for item in items {
                            let homeItem = HomeItem3(dict: item as! [String: AnyObject])
                            homeItems.append(homeItem)
                        }
                        finished(homeItems: homeItems)
                    }
                }
        }
    }
    /// 获取第二页推荐数据
    func loadCommunityFirstInfo(finished:(communities: [Community1]) -> ())
    {
        let url = BASE_URL
        let params = ["methodName": "ShequRecommend",
                      "version": 4.5]
        Alamofire
            .request(.POST, url, parameters: params)
            .responseJSON { (response) in
                guard response.result.isSuccess else
                {
                    SVProgressHUD.showErrorWithStatus("加载失败...")
                    return
                }
                if let value = response.result.value
                {
                    let dict = JSON(value)
                    let code = dict["code"].intValue
                    let message = dict["message"].stringValue
                    guard code == RETURN_OK else {
                        SVProgressHUD.showInfoWithStatus(message)
                        return
                    }
                    let data = dict["data"].dictionary
                    //  字典转成模型
                    if let items = data!["items"]?.arrayObject
                    {
                        var communities = [Community1]()
                        for item in items {
                            let community = Community1(dict: item as! [String: AnyObject])
                            communities.append(community)
                        }
                        finished(communities: communities)
                    }
                }
        }
    }
    /// 获取第二页最新数据
    func loadCommunitySecondInfo(finished:(communities: [Community2]) -> ())
    {
        let url = BASE_URL
        let params = ["last_id": "0",
                      "methodName": "ShequList",
                      "page": "1",
                      "size": "10",
                      "version": "4.5"]
        Alamofire
            .request(.POST, url, parameters: params)
            .responseJSON { (response) in
                guard response.result.isSuccess else
                {
                    SVProgressHUD.showErrorWithStatus("加载失败...")
                    return
                }
                if let value = response.result.value
                {
                    let dict = JSON(value)
                    let code = dict["code"].intValue
                    let message = dict["message"].stringValue
                    guard code == RETURN_OK else {
                        SVProgressHUD.showInfoWithStatus(message)
                        return
                    }
                    let data = dict["data"].dictionary
                    //  字典转成模型
                    if let items = data!["items"]?.arrayObject
                    {
                        var communities = [Community2]()
                        for item in items {
                            let community = Community2(dict: item as! [String: AnyObject])
                            communities.append(community)
                        }
                        finished(communities: communities)
                    }
                }
        }
    }
    /// 获取第三页商城数据
    func loadShopInfo(finished:(shops: [Shop]) -> ())
    {
        let url = BASE_URL
        let params = ["methodName":	"MallHomepageList",
                      "version": "4.5",
                      "page": "1",
                      "size": "10"]
        Alamofire
            .request(.POST, url, parameters: params)
            .responseJSON { (response) in
                guard response.result.isSuccess else
                {
                    SVProgressHUD.showErrorWithStatus("加载失败...")
                    return
                }
                if let value = response.result.value
                {
                    let dict = JSON(value)
                    let code = dict["code"].intValue
                    let message = dict["message"].stringValue
                    guard code == RETURN_OK else {
                        SVProgressHUD.showInfoWithStatus(message)
                        return
                    }
                    let data = dict["data"].dictionary
                    //  字典转成模型
                    if let items = data!["items"]?.arrayObject
                    {
                        var shops = [Shop]()
                        for item in items {
                            let shop = Shop(dict: item as! [String: AnyObject])
                            shops.append(shop)
                        }
                        finished(shops: shops)
                    }
                }
        }
    }
    /// 获取第四页食课数据
    func loadFoodCourseInfo(finished:(foodCourses: [FoodCourse]) -> ())
    {
        let url = BASE_URL
        let params = ["methodName": "CourseIndex",
                      "page": "1",
                      "size": "10",
                      "version": "4.5"]
        Alamofire
            .request(.POST, url, parameters: params)
            .responseJSON { (response) in
                guard response.result.isSuccess else
                {
                    SVProgressHUD.showErrorWithStatus("加载失败...")
                    return
                }
                if let value = response.result.value
                {
                    let dict = JSON(value)
                    let code = dict["code"].intValue
                    let message = dict["message"].stringValue
                    guard code == RETURN_OK else {
                        SVProgressHUD.showInfoWithStatus(message)
                        return
                    }
                    let data = dict["data"].dictionary
                    //  字典转成模型
                    if let items = data!["items"]?.arrayObject
                    {
                        var foodCourses = [FoodCourse]()
                        for item in items {
                            let foodCourse = FoodCourse(dict: item as! [String: AnyObject])
                            foodCourses.append(foodCourse)
                        }
                        finished(foodCourses: foodCourses)
                    }
                }
        }
    }

}
