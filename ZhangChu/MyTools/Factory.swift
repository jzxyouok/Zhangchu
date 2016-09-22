//
//  Factory.swift
//  ZhangChu
//
//  Created by myappleair on 16/8/13.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit

class Factory: NSObject
{
    //UIView
    static func createViewWith(frame: CGRect) -> UIView
    {
        let view = UIView(frame: frame)
        return view
    }
    //UILabel
    static func createLabelWith(frame: CGRect, text: String, font: UIFont, textAlignment: NSTextAlignment, textColor: UIColor) -> UILabel
    {
        let label = UILabel(frame: frame)
        label.text = text
        label.textColor = textColor
        label.textAlignment = textAlignment
        label.font = font
        return label
    }
    //UIButton
    static func createButtonWith(frame: CGRect, type: UIButtonType, title: String, titleColor: UIColor, imageName: String, target: AnyObject?, action: Selector, backgroundImageName: String) -> UIButton
    {
        let button = UIButton(type: type)
        button.frame = frame
        button.setTitle(title, forState: UIControlState.Normal)
        button.setTitleColor(titleColor, forState: UIControlState.Normal)
        //设置图片
        button.setImage(UIImage(named: imageName), forState: UIControlState.Normal)
        //设置背景图片
        button.setBackgroundImage(UIImage(named: backgroundImageName), forState: UIControlState.Normal)
        //添加响应事件
        button.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
        return button
    }
    //UIImageView
    static func createImageViewWith(frame: CGRect, imageName: String) -> UIImageView
    {
        let imageView = UIImageView(frame: frame)
        imageView.image = UIImage(named: imageName)
        return imageView
    }
    //UITextField
    static func createTextFieldWith(frame: CGRect, text: String, placeholder: String) -> UITextField
    {
        let textField = UITextField(frame: frame)
        textField.text = text
        textField.placeholder = placeholder
        return textField
    }
    
    
}
