//
//  NetWorkingTool.swift
//  ZhangChu
//
//  Created by sword on 16/8/23.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit

import Alamofire
import SVProgressHUD
import SwiftyJSON

class NetWorkingTool: NSObject {
    
    static let shareNetWorkingTool = NetWorkingTool()
     //首页推荐数据
    func loadHomeData(finished:(adCourse:[AdCourse], widget: [Widget])->()) {
        
        let url = BASE_URL
        
        let parameter = ["methodName":"SceneHome", "version":"4.40"]
        
        Alamofire.request(.POST, url, parameters: parameter).responseJSON { (response) in
            guard response.result.isSuccess else {
                
                SVProgressHUD.showErrorWithStatus("加载失败，请重试！")
                
                return
            }
            
            if let value = response.result.value {
                
                
                
                let dict = JSON(value)
               
                
                let code = dict["code"].intValue
                
                let message = dict["message"].stringValue
                
                guard code == 0 else {
                    
                    SVProgressHUD.showInfoWithStatus(message)
                    
                    return
                }
                
                
                let data = dict["data"].dictionary
                
                
                var adArray = [AdCourse]()
                
                var widgetArray = [Widget]()
                
                if  let banners = data!["banner"]?.arrayObject {
                    
                    
                    for banner in banners {
                        
                        let course = AdCourse(dict: banner as! [String: AnyObject])
                        
                        
                        adArray.append(course)
                        
                        
                    }
                    
                }
                
                if let widgets = data!["widgetList"]?.arrayObject {
                    
                    for widget in widgets {
                        
                        let wid = Widget(dict: widget as! [String: AnyObject])
                        
                        widgetArray.append(wid)
                    
                    }
                   
                    
                }
                
                finished(adCourse: adArray, widget: widgetArray)
                
            }
            
            
        }
        
        
    }
    //sceneList
    
    func loadAllScenesData(page: Int, finished: (scenes:[Scenes])->()) {
        
        let url = BASE_URL
        
        let parameter = ["size": "20", "page": "\(page)", "methodName": "SceneList", "version": "4.40"]
        
        Alamofire.request(.POST, url, parameters: parameter).responseJSON { (response) in
            
            guard response.result.isSuccess else {
                
                SVProgressHUD.showInfoWithStatus("加载失败，请重试！")
                return
            }
            
            if let value = response.result.value {
                
                let dict = JSON(value)
                
                let data = dict["data"].dictionary
                
                var mscenes = [Scenes]()
                
                if let datas = data!["data"]?.arrayObject {
                    
                    for data in datas {
                        
                        let scene = Scenes(dict: data as![String :AnyObject])
                        
                        mscenes.append(scene)
                    }
                    
                }
                
               finished(scenes: mscenes)
                
                
            }
            
            
        }
        
        
    }
    
    
    //sceneInfo 
    
    //http://api.izhangchu.com/?&methodName=SceneInfo&size=20&page=1&scene_id=58&version=4.40
    
    func loadSceneInfoData(page: Int,sceneID : Int ,finished: ((sceneInfo :[SceneInfo])->())) {
        
        let url = BASE_URL
        
        
        let parameter = ["methodName":"SceneInfo", "size":"20","page": "\(page)","scene_id":"\(sceneID)", "version": "4.40"]
        
        Alamofire.request(.POST, url, parameters: parameter).responseJSON { (response) in
            guard response.result.isSuccess else {
                
                SVProgressHUD.showWithStatus("加载失败，请重试")
                
                return
            }
            
            if let value = response.result.value {
                
                
                let dict = JSON(value)
                
                
                let datas = dict["data"].dictionary
                
                var scenes = [SceneInfo]()
                
                if let datas = datas!["dishes_list"]?.arrayObject {
                    
                    for data in datas {
                        
                        let info = SceneInfo(dict: data as! [String :AnyObject])
                        
                        scenes.append(info)
                        
                    }
                    
                }
                
                finished(sceneInfo: scenes)
            }
            
        }
        
        
        
    }
    //dishes_id, methodName:DishesView, version: 4.40
    
    func loadScenesDetailDataWith(dishID: String, finished: ((sceneDetail:SceneDetail) -> ())) {
        
        let url = BASE_URL
        
        let parameter = ["dishes_id":dishID, "methodName":"DishesView", "version":"4.40"]
        
        Alamofire.request(.POST, url, parameters: parameter).responseJSON { (responseObject) in
            guard responseObject.result.isSuccess else {
                
                SVProgressHUD.showWithStatus("加载失败，请重试")
                return
            }
            
            if let value = responseObject.result.value {
                
                
                let dict = JSON(value)
                
                let datas = dict["data"].dictionaryObject
                let model = SceneDetail(dict: datas!)
                
                finished(sceneDetail: model)
                
                
            }
            
        }
        
        
    }
    
    //material 
    //http://api.izhangchu.com/?methodName=MaterialSubtype&version=4.40
    
    func loadMaterialData(finished:((materials:[Material])->())) {
        
        let url = BASE_URL
        
        let para = ["methodName":"MaterialSubtype", "version":"4.40"]
        
        Alamofire.request(.POST, url, parameters: para).responseJSON { (responseObject) in
            guard responseObject.result.isSuccess else {
                
                SVProgressHUD.showWithStatus("加载失败，请重试！")
                
                return
            }
            
            if let value = responseObject.result.value {
                
                let dict = JSON(value)
                
                var matertialArray = [Material]()
                
                if let data1 = dict["data"].dictionary {
                    
                    if let data = data1["data"]!.arrayObject {
                        
                        for item in data {
                            
                            
                            let model = Material(dict: item as! [String: AnyObject])
                            
                            matertialArray.append(model)
                        }
                    }
                    
                    
                }
                
                    finished(materials: matertialArray)
                
                
            }
            
            
            
        }
        
        
    }
    
    
}
