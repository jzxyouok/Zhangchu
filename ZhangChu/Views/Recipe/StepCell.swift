//
//  StepCell.swift
//  ZhangChu
//
//  Created by sword on 16/8/30.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit

class StepCell: UITableViewCell {
    
    var mainImageView = UIImageView()
    
    var orderLabel = UILabel()
    
    var stepDescLabel = UILabel()
    
    var step: Step! {
        
        didSet {
            
            mainImageView.sd_setImageWithURL(NSURL(string: step.dishes_step_image!)!, placeholderImage: UIImage(named: "placeholder.jpg"))
            
            orderLabel.text = "\((step.dishes_step_order)!)."
            
            stepDescLabel.text = step.dishes_step_desc
            
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()

    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.mainImageView = Factory.createImageViewWith(CGRectMake(0, 0, screenWidth, screenHeight * 0.3 - 30), imageName: "")
        
        self.contentView.addSubview(self.mainImageView)
        
        self.orderLabel = Factory.createLabelWith(CGRectMake(5, self.mainImageView.frame.size.height , 25, 25), text: "", font: UIFont.systemFontOfSize(14), textAlignment: NSTextAlignment.Center, textColor: UIColor.orangeColor())
        
        self.contentView.addSubview(self.orderLabel)
        
        self.stepDescLabel = Factory.createLabelWith(CGRectMake(self.orderLabel.frame.size.width + self.orderLabel.frame.origin.x , self.orderLabel.frame.origin.y, screenWidth - 45, 25), text: "", font: UIFont.systemFontOfSize(14), textAlignment: NSTextAlignment.Left, textColor: UIColor.blackColor())
        
        self.contentView.addSubview(stepDescLabel)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
