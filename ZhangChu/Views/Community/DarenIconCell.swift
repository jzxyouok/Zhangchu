//
//  DarenIconCell.swift
//  ZhangChu
//
//  Created by sword on 16/8/17.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit

class DarenIconCell: UITableViewCell {
    
    var iconImageView = UIImageView()
    
    var nameLabel = UILabel()
    
    var fansLabel = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    func setupUI() {
       
        //头像
        self.iconImageView = UIImageView(frame: CGRectMake(20, 5, screenWidth / 4 - 40, screenWidth / 4 - 40))
        
        self.iconImageView.layer.cornerRadius = (screenWidth / 4 - 40 ) / 2
        self.iconImageView.layer.masksToBounds = true 
        
        self.iconImageView.clipsToBounds = true
        
        self.contentView.addSubview(self.iconImageView)
        
        //达人姓名
        
        
        
        self.nameLabel = UILabel(frame: CGRectMake(0, screenWidth / 4 - 35, screenWidth / 4 , 20))
        
        self.nameLabel.textColor = UIColor.blackColor()
        
        self.nameLabel.textAlignment = .Center
        
        self.nameLabel.font = UIFont.systemFontOfSize(titleFont)
        
        self.contentView.addSubview(self.nameLabel)
        
        //粉丝数
        
        self.fansLabel = UILabel(frame: CGRectMake(0, screenWidth / 4 - 15, screenWidth / 4, 15))
        
        self.fansLabel.textAlignment = .Center
        
        self.fansLabel.textColor = UIColor.lightGrayColor()
        
        self.fansLabel.font = UIFont.systemFontOfSize(detailTitleFont)
        
        self.contentView.addSubview(self.fansLabel)
        
        
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
