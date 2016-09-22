//
//  CustomTool.swift
//  ZhangChu
//
//  Created by myappleair on 16/8/13.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit

//Response Code	200 操作成功
let RETURN_OK = 200
//服务器地址
let BASE_URL = "http://api.izhangchu.com/?"


//表格视图的头视图高度
let headerHeight : CGFloat = 20 
//详情字体大小
let detailTitleFont : CGFloat = 12

//子标题字体大小
let titleFont: CGFloat = 15

//播放按钮
let playButtonWidth :CGFloat = 30.0
//屏幕宽
let screenWidth = UIScreen.mainScreen().bounds.size.width
//屏幕高
let screenHeight = UIScreen.mainScreen().bounds.size.height
//iphone5
let isIPhone5 = screenHeight == 568 ? true : false
//iphone6
let isIPhone6 = screenHeight == 667 ? true : false
//iphone6P
let isIPhone6P = screenHeight == 736 ? true : false


//最新集合视图尺寸
let collectionViewHeight : CGFloat = screenWidth / 2 + 50

//商城集合视图尺寸
let collectionViewHeightOfStore : CGFloat = screenWidth  * 0.75

extension UIColor
{
    static func RGBA(red: CGFloat, _ green: CGFloat, _ blue: CGFloat, _ alpha: CGFloat) -> UIColor
    {
        return UIColor(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: alpha)
    }
}
