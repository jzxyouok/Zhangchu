//
//  StoreCell.swift
//  ZhangChu
//
//  Created by sword on 16/8/18.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit

class StoreCell: UICollectionViewCell {
    
    var goodsImageView = UIImageView()
    
    var goodsNameLabel = UILabel()
    
    var salesNumLabel = UILabel()
    
    var postFreeLabel = UILabel()
    
    var newPriceLabel = UILabel()
    
    var oldPriceLabel = UILabel()
    
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    func setupUI() {
        
        //goodsImageView
        
        self.goodsImageView = Factory.createImageViewWith(CGRectMake(0, 0, (screenWidth  - 10) / 2, (screenWidth - 10 ) / 2), imageName: "placeholder.jpg")
        
        self.contentView.addSubview(self.goodsImageView)
        
        //goodsNameLabel
        
        self.goodsNameLabel = Factory.createLabelWith(CGRectMake(5, self.goodsImageView.frame.size.height, self.goodsImageView.frame.size.width - 10, collectionViewHeightOfStore / 9), text: "美的电饭煲最经济实惠活动期间八折送厨具还有神秘礼品赠送", font: UIFont.systemFontOfSize(detailTitleFont), textAlignment: .Left, textColor: UIColor.blackColor())
        
        self.goodsNameLabel.numberOfLines = 0
        self.goodsNameLabel.lineBreakMode = .ByTruncatingTail
        self.contentView.addSubview(self.goodsNameLabel)
        
        
        //salesNumberLabel 
        
        self.salesNumLabel = Factory.createLabelWith(CGRectMake(5, self.goodsImageView.frame.size.height + self.goodsNameLabel.frame.height + 10, screenWidth / 4, collectionViewHeightOfStore / 9 - 5), text: "已售：200", font: UIFont.systemFontOfSize(detailTitleFont), textAlignment: .Left, textColor: UIColor.lightGrayColor())
        
        self.contentView.addSubview(self.salesNumLabel)
        
        //postFreeLabel 
        
        self.postFreeLabel = Factory.createLabelWith(CGRectMake(self.salesNumLabel.frame.size.width + 10, self.goodsNameLabel.frame.size.height + self.goodsImageView.frame.size.height + 10, screenWidth / 4, collectionViewHeightOfStore / 9 - 5), text: "包邮", font: UIFont.systemFontOfSize(detailTitleFont), textAlignment: .Left, textColor: UIColor.lightGrayColor())
        
        self.contentView.addSubview(self.postFreeLabel)
        
        //newPriceLabel
        
        self.newPriceLabel = Factory.createLabelWith(CGRectMake(5, self.goodsImageView.frame.size.height + self.goodsNameLabel.frame.size.height + self.salesNumLabel.frame.size.height + 15, screenWidth / 4, collectionViewHeightOfStore / 9 - 5), text: "￥1555", font: UIFont.boldSystemFontOfSize(detailTitleFont + 2), textAlignment: .Left, textColor: UIColor.redColor())
        
        self.contentView.addSubview(self.newPriceLabel)
        
        //oldPriceLabel 
         self.oldPriceLabel = Factory.createLabelWith(CGRectMake(self.newPriceLabel.frame.size.width + 5, self.goodsImageView.frame.size.height + self.goodsNameLabel.frame.size.height + self.salesNumLabel.frame.size.height + 15, screenWidth / 4, collectionViewHeightOfStore / 9 - 5), text: "原价： 2000", font: UIFont.systemFontOfSize(detailTitleFont), textAlignment: .Left, textColor: UIColor.lightGrayColor())
        
        self.contentView.addSubview(self.oldPriceLabel)
        
      
        
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
