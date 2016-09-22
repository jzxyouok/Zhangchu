//
//  StudyListCell.swift
//  ZhangChu
//
//  Created by sword on 16/8/18.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit

class StudyListCell: UITableViewCell {
    
    var mainImageView = UIImageView()
    
    var rightIconImageView = UIImageView()
    
    var titleLabel = UILabel()
    
    var updateLabel = UILabel()
    
    var classNumLabel = UILabel()
    
    var classNameLabel = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
    
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        createCell()
    }
    func createCell() {
        //mainImageView
        self.mainImageView = Factory.createImageViewWith(CGRectMake(0, 0, screenWidth, collectionViewHeight * 0.7), imageName: "placeholder.jpg")
        self.contentView.addSubview(self.mainImageView)
        
        //rightIconImageView
        
        self.rightIconImageView = Factory.createImageViewWith(CGRectMake(screenWidth - collectionViewHeight * 0.3 - 15, self.mainImageView.frame.size.height - collectionViewHeight * 0.15, collectionViewHeight * 0.3, collectionViewHeight * 0.3), imageName: "placeholder.jpg")
        
        self.rightIconImageView.layer.cornerRadius = collectionViewHeight * 0.15
        self.rightIconImageView.layer.masksToBounds = true
        
        self.rightIconImageView.layer.borderWidth = 1
        
        self.rightIconImageView.layer.borderColor = UIColor.whiteColor().CGColor
        
        self.contentView.addSubview(self.rightIconImageView)
        
        //titleLabel
        
        self.titleLabel = Factory.createLabelWith(CGRectMake(10, self.mainImageView.frame.size.height, screenWidth - 20, collectionViewHeight * 0.15), text: "十分钟搞定一顿营养简餐", font: UIFont.systemFontOfSize(titleFont), textAlignment: .Left, textColor: UIColor.blackColor())
        
        self.contentView.addSubview(self.titleLabel)
        
        //updateLabel
        
        self.updateLabel = Factory.createLabelWith(CGRectMake(10, self.mainImageView.frame.size.height + self.titleLabel.frame.size.height + 5, (screenWidth - 20) / 3, collectionViewHeight * 0.15 - 5), text: "更新至100集", font: UIFont.systemFontOfSize(detailTitleFont), textAlignment: .Left, textColor: UIColor.lightGrayColor())
        
        self.contentView.addSubview(self.updateLabel)
        
        //classnumLabel
        
        self.classNumLabel = Factory.createLabelWith(CGRectMake(screenWidth / 3, self.updateLabel.frame.origin.y, self.updateLabel.frame.size.width, self.updateLabel.frame.size.height), text: "上课人数100000", font: UIFont.systemFontOfSize(detailTitleFont), textAlignment: .Left, textColor: UIColor.lightGrayColor())
        
        self.contentView.addSubview(self.classNumLabel)
        
        
        //classNameLabel
        
        self.classNameLabel = Factory.createLabelWith(CGRectMake(screenWidth / 3 * 2, self.classNumLabel.frame.origin.y, self.classNumLabel.frame.size.width, self.classNumLabel.frame.size.height), text: "小厨666", font: UIFont.systemFontOfSize(detailTitleFont), textAlignment: .Center, textColor: UIColor.lightGrayColor())
        
        self.contentView.addSubview(self.classNameLabel)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
