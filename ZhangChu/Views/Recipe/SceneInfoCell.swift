//
//  SceneInfoCell.swift
//  ZhangChu
//
//  Created by sword on 16/8/29.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit

class SceneInfoCell: UITableViewCell {
    
    var mainImageView = UIImageView()
    
    var playButton = UIButton()
    
    var titleLabel = UILabel()
    
    var  infoLabel = UILabel()
    
    var tagLabels = [UILabel]()
    
    var sceneModel : SceneInfo! {
        
        didSet {
            
            self.mainImageView.sd_setImageWithURL(NSURL(string: sceneModel.image!)!, placeholderImage: UIImage(named: "placeholder.png"))
            
            self.titleLabel.text = sceneModel.dishes_name
            
            self.infoLabel.text = sceneModel.dishes_desc
            
            
            for i in 0..<3 {
                let label = tagLabels[i]
                label.text = sceneModel.tag_info[i].text
            }
            
           
            
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //image
        
        self.mainImageView = Factory.createImageViewWith(CGRectMake(0, 10, screenWidth / 3, screenHeight / 6 - 10), imageName: "")
        
        self.contentView.addSubview(self.mainImageView)
        
        
        //playButton
        
        self.playButton = Factory.createButtonWith(CGRectMake(self.mainImageView.frame.size.width / 2 - 22, self.mainImageView.frame.origin.y + self.mainImageView.frame.size.height / 2 - 22, 44, 44), type: .Custom, title: "", titleColor: UIColor.whiteColor(), imageName: "play.png", target: self, action: #selector(playVideo(_:)), backgroundImageName: "")
        
        self.mainImageView.userInteractionEnabled = true
        
        self.mainImageView.addSubview(self.playButton)
        
        //titleLabel 
        
        self.titleLabel = Factory.createLabelWith(CGRectMake(self.mainImageView.frame.size.width + 15, self.mainImageView.frame.origin.y - 5, screenWidth / 3 * 2 - 30, screenHeight / 18 - 10), text: "", font: UIFont.systemFontOfSize(15), textAlignment: .Left, textColor: UIColor.blackColor())
        
        self.contentView.addSubview(self.titleLabel)
        
        //infolabel
        
        self.infoLabel = Factory.createLabelWith(CGRectMake(self.titleLabel.frame.origin.x, self.titleLabel.frame.size.height + self.titleLabel.frame.origin.y + 5, self.titleLabel.frame.size.width, screenHeight / 18 ), text: "", font: UIFont.systemFontOfSize(12), textAlignment: NSTextAlignment.Left, textColor: UIColor.lightGrayColor())
        self.infoLabel.numberOfLines = 0
        
        self.contentView.addSubview(self.infoLabel)
        
        
        //labels 
        
        for i in 0..<3 {
            
            let label = Factory.createLabelWith(CGRectMake(self.infoLabel.frame.origin.x + CGFloat(i) * (screenWidth * 2 / 9), self.infoLabel.frame.origin.y + self.infoLabel.frame.size.height + 10,screenWidth / 5 - 25, screenHeight / 18 - 20), text: "\(i)", font: UIFont.systemFontOfSize(11), textAlignment: .Center, textColor: UIColor.orangeColor())
            
            label.layer.cornerRadius = 3
            
            label.layer.borderWidth = 1
            
            label.layer.borderColor = UIColor.orangeColor().CGColor
            
            self.contentView.addSubview(label)
            
            self.tagLabels.append(label)
            
        }
        
        
        
    }
    
    func  playVideo(button: UIButton) {
        
        print("播放视频")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
