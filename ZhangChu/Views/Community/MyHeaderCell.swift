//
//  HeaderCell.swift
//  ZhangChu
//
//  Created by sword on 16/8/17.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit

class MyHeaderCell: UITableViewCell {

    var iconImageView = UIImageView()
    var itemLabel = UILabel()
    var moreBtn = UIButton()
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
   override  init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        createUI()
    }
    func createUI() {
       
        // 左上角小图标
        
        self.iconImageView = UIImageView(frame: CGRectMake(0, 0, headerHeight, headerHeight))
        self.contentView.addSubview(self.iconImageView)
       
        //名称标签
        self.itemLabel = UILabel(frame: CGRectMake(headerHeight + 10, 0 , 60, headerHeight))
        self.itemLabel.textColor = UIColor.blackColor()
        
        self.itemLabel.font = UIFont.systemFontOfSize(titleFont)
        
        self.itemLabel.textAlignment = .Left
        
        self.contentView.addSubview(self.itemLabel)
        
        //更多按钮
        self.moreBtn = UIButton(type: .Custom)
        
        self.moreBtn.frame = CGRectMake(screenWidth - headerHeight, 0, headerHeight, headerHeight)
        
        self.moreBtn.setImage(UIImage(named: ""), forState: .Normal)
        self.contentView.addSubview(self.moreBtn)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
