//
//  SceneCell.swift
//  ZhangChu
//
//  Created by sword on 16/8/16.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit

class SceneCell: UITableViewCell {
    
    var mainImageView = UIImageView()
    
    var mainButton = UIButton()
    
    var imageViews = [UIImageView]()
    
    var imageButtons = [UIButton]()
    
    var headButton = UIButton()
    
    var headLabel = UILabel()
    
    var footLabel = UILabel()
    
    
    
    var imageArray = []
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        
        
    }
    
    func setupUI() {
        
        self.imageArray = ["","","",""]
        /*
        //头按钮和标签
        self.headButton = UIButton(type: .Custom)
        self.headButton.frame = CGRectMake(0, 0, self.frame.width, 20)
        self.headLabel.frame = self.headButton.frame
        self.headLabel.textAlignment = .Center
        self.headLabel.font = UIFont.systemFontOfSize(titleFont)
        self.contentView.addSubview(headLabel)
        self.contentView.addSubview(headButton)
        */
        
        //第一个图
        self.mainImageView = UIImageView(frame: CGRectMake(0, 0, screenWidth / 3, 160))
        self.mainImageView.image = UIImage(named: "placeholder.jpg")
        
        self.contentView.addSubview(mainImageView)
        
        //图上按钮
        self.mainButton = UIButton(type: .Custom)
        
        self.mainButton.frame = self.mainImageView.frame
        
        //四张图片及按钮
        for i in 0..<imageArray.count {
            
            let j = CGFloat(i % 2)
            let k = CGFloat(i / 2)
            let imageView = UIImageView(frame: CGRectMake(screenWidth / 3 * (2 - j) ,  k * 80 , screenWidth / 3, 80))
            imageView.tag = i + 230
            imageView.userInteractionEnabled = true
            imageView.image = UIImage(named: self.imageArray[i] as! String)
            let btn = UIButton(type: .Custom)
            btn.frame.size = CGSizeMake(playButtonWidth, playButtonWidth)
            btn.frame.origin = CGPointMake(imageView.frame.width / 2 - playButtonWidth / 2,imageView.frame.height / 2 - playButtonWidth / 2 )
            btn.tag = i + 240
            btn.setImage(UIImage(named: "play.png"), forState: .Normal)
            imageView.addSubview(btn)
            self.imageButtons.append(btn)
            self.contentView.addSubview(imageView)
            
            self.imageViews.append(imageView)
         
            
        }
        
        //footLabel display detail information
        
        
        self.footLabel = UILabel(frame: CGRectMake(0, self.headLabel.frame.height + self.mainImageView.frame.height , screenWidth, 30))
        self.footLabel.textAlignment = .Center
        self.footLabel.text = "美味佳肴 >"
        self.footLabel.textColor = UIColor.lightGrayColor()
        self.footLabel.font = UIFont.systemFontOfSize(detailTitleFont)
        self.contentView.addSubview(self.footLabel)
        
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
