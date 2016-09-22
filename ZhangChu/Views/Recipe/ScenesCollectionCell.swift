//
//  ScenesCollectionCell.swift
//  ZhangChu
//
//  Created by sword on 16/8/26.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit

class ScenesCollectionCell: UICollectionViewCell {
    
    var imageView = UIImageView()
    
    var titleLabel = UILabel()
    
    var numLabel = UILabel()
    
    var model: Scenes! {
        didSet {
            
            self.imageView.sd_setImageWithURL(NSURL(string: model.scene_background!), placeholderImage: UIImage(named: "placeholder.jpg"))
            
            self.titleLabel.text = model.scene_title
            
            self.numLabel.text = "\(model.dish_count!)"+"道菜"
            
        }
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.imageView = Factory.createImageViewWith(CGRectMake(0, 0, screenWidth / 3, 160), imageName: "")
        
        self.imageView.userInteractionEnabled = true
        
        self.contentView.addSubview(self.imageView)
        
        self.titleLabel = Factory.createLabelWith(CGRectMake(10, self.imageView.frame.size.height / 3 * 2, self.imageView.frame.size.width - 20, self.imageView.frame.size.height / 6), text: "", font: UIFont.systemFontOfSize(13), textAlignment: .Center, textColor: UIColor.whiteColor())
        
        self.imageView.addSubview(titleLabel)
        
        self.numLabel = Factory.createLabelWith(CGRectMake(10, self.titleLabel.frame.origin.y + self.titleLabel.frame.size.height + 5, self.imageView.frame.size.width - 20, self.titleLabel.frame.size.height / 6 - 10), text: "", font: UIFont.systemFontOfSize(10), textAlignment: .Center, textColor: UIColor.whiteColor())
        
        self.imageView.addSubview(self.numLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
