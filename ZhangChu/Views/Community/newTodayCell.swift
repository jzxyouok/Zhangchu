//
//  newTodayCell.swift
//  ZhangChu
//
//  Created by sword on 16/8/16.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit

class newTodayCell: UITableViewCell {
    
    @IBOutlet var imageViews: [UIImageView]!
    

    @IBOutlet var titleLabels: [UILabel]!
    
    
    @IBOutlet var detailLabels: [UILabel]!
    
    var playBtnArray = [UIButton]()
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    /*
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        //自定义播放按钮
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        for i in 0..<imageViews.count {
            
            let imageView = imageViews[i]
            let frame = imageView.frame
            let btn = UIButton(type: .Custom)
            btn.frame = CGRectMake(frame.width / 2 - 15, frame.height / 2 - 15, 30, 30)
            btn.setTitle("Play", forState: .Normal)
            btn.setImage(UIImage(named: "play.png"), forState: .Normal)
            imageView.addSubview(btn)
            self.playBtnArray.append(btn)
            
        }
    }
 
    
    required init?(coder aDecoder: NSCoder) {
        
        
        fatalError("init(coder:) has not been implemented")
    }
 */
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
