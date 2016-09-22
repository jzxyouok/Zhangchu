//
//  FootCell.swift
//  ZhangChu
//
//  Created by sword on 16/8/16.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit

class LastFootCell: UITableViewCell {
    var allSceneButton = UIButton()
  
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    func setupUI() {
        
        self.allSceneButton = UIButton(type: .Custom)
        
        self.allSceneButton.frame = CGRectMake(0, 0, screenWidth, 30)
        
        self.allSceneButton.setTitle("全部场景  >", forState: .Normal)
        
        self.allSceneButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        
        self.allSceneButton.titleLabel?.font = UIFont.systemFontOfSize(titleFont)
        self.contentView.addSubview(self.allSceneButton)
        
        
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
