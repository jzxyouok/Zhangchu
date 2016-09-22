//
//  shareCell.swift
//  ZhangChu
//
//  Created by sword on 16/8/17.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit

class ShareCell: UICollectionViewCell {
    
    var mainImageView = UIImageView()
    
    var iconImageView = UIImageView()
    
    var nameLabel = UILabel()
    
    var shareTimeLabel = UILabel()
    
    var likeNumLabel = UILabel()
    
    var likeBtn = UIButton()
    
    var bottomView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        createUI()
        
    }
    
    func createUI() {
        
        //mainImageView
        self.mainImageView = Factory.createImageViewWith(CGRectMake(0, 0, screenWidth / 2 , screenWidth / 2), imageName: "placeholder.jpg")
        
        self.contentView.addSubview(self.mainImageView)
        
        //iconImageView
        
        self.iconImageView = Factory.createImageViewWith(CGRectMake(5, self.mainImageView.frame.size.height + 10, 40, 40), imageName: "placeholder.jpg")
        self.iconImageView.layer.cornerRadius = 20
        
        self.iconImageView.layer.masksToBounds = true
        
        self.contentView.addSubview(self.iconImageView)
        
        //nameLabel
        
        self.nameLabel = Factory.createLabelWith(CGRectMake(self.iconImageView.frame.size.width + 10, self.mainImageView.frame.size.height + 10, screenWidth / 4, 22), text: "厨神神作", font: UIFont.systemFontOfSize(titleFont - 3), textAlignment: .Left, textColor: UIColor.blackColor())
        
        self.contentView.addSubview(self.nameLabel)
        
        //sharetimeLabel
        
        self.shareTimeLabel = Factory.createLabelWith(CGRectMake(self.iconImageView.frame.size.width + 10,collectionViewHeight - 20, screenWidth / 4, 20), text: "1小时之前", font: UIFont.systemFontOfSize(detailTitleFont), textAlignment: .Left, textColor: UIColor.lightGrayColor())
        
        self.contentView.addSubview(self.shareTimeLabel)
        
        //likeButton
        
        self.likeBtn = Factory.createButtonWith(CGRectMake(screenWidth / 2 - 20, collectionViewHeight - 20, 20, 20), type: .Custom, title: "赞", titleColor: UIColor.clearColor(), imageName: "", target: nil, action: #selector(likeButtonIsClicked(_ :)), backgroundImageName: "")
        
        self.contentView.addSubview(self.likeBtn)
        
        
        
        
        //likeNumLabel
        
        self.likeNumLabel = Factory.createLabelWith(CGRectMake(screenWidth / 2 - 60, collectionViewHeight - 20, 40, 20), text: "2000", font: UIFont.systemFontOfSize(detailTitleFont), textAlignment: .Left, textColor: UIColor.lightGrayColor())
        
        self.contentView.addSubview(self.likeNumLabel)
        
        //bottomView
        
        self.bottomView = UIView(frame: CGRectMake(0, collectionViewHeight + 5 , screenWidth, 5))
        
        self.bottomView.backgroundColor = UIColor.lightGrayColor()
        
        self.contentView.addSubview(self.bottomView)
        
        
        
    }
    
    func likeButtonIsClicked(sender: UIButton) {
        
        
    }

    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
