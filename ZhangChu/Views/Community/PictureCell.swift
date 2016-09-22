
//
//  PictureCell.swift
//  ZhangChu
//
//  Created by sword on 16/8/17.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit

class PictureCell: UITableViewCell {
    
    var mainImageView = UIImageView()

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.mainImageView = UIImageView(frame: CGRectMake(0, 0, screenWidth / 4, screenWidth / 4))
        
        self.contentView.addSubview(self.mainImageView)
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
