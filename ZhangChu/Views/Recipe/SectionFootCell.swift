//
//  SectionHeaderViewCell.swift
//  ZhangChu
//
//  Created by sword on 16/8/16.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit

class SectionFootCell: UITableViewCell {
    
    var headerView = UIView()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.headerView = UIView(frame: CGRectMake(0, 0 , screenWidth, 10))
        self.headerView.backgroundColor = UIColor.lightGrayColor()
        
        self.contentView.addSubview(self.headerView)
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
