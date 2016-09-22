//
//  ButtonCell.swift
//  ZhangChu
//
//  Created by sword on 16/8/18.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit

class ButtonCell: UICollectionViewCell {
    
    var button = UIButton()
    
    var model : SubMaterial! {
        
        didSet {
            
            button.setTitle(model.text, forState: .Normal)
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //
        
        self.button = UIButton(type: .Custom)
        
        self.button.frame = CGRectMake(0, 0,  (screenWidth - 60) / 5, (screenWidth - 60) / 5 * ( 2 / 3))
        
        
        self.button.setTitleColor(UIColor.blackColor(), forState: .Normal)
        
        self.button.titleLabel?.font = UIFont.systemFontOfSize(13)
        
        self.button.layer.cornerRadius = 5
        
        self.button.layer.masksToBounds = true
        
        self.button.backgroundColor = UIColor.whiteColor()
        
        self.button.layer.borderColor = UIColor.orangeColor().CGColor
        
        self.button.layer.borderWidth = 2
        
        self.contentView.addSubview(self.button)
        
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
