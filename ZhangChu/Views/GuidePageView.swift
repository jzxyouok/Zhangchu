//
//  GuidePageView.swift
//  ZhangChu
//
//  Created by sword on 16/8/13.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit

class GuidePageView: UIView {

    var scrollView : UIScrollView?
    
    var enterBtn: UIButton?
    
    init(frame: CGRect, imageArray: NSArray) {
        super.init(frame: frame)
        self.scrollView = UIScrollView(frame: CGRectMake(0, 0 , screenWidth, screenHeight))
        self.scrollView?.showsHorizontalScrollIndicator = false
        self.scrollView?.pagingEnabled = true
        self.addSubview(self.scrollView!)
        
        self.scrollView?.contentSize = CGSizeMake(CGFloat(imageArray.count), 0)
        
        for i in 0..<imageArray.count {
            
            let imageView = Factory.createImageViewWith(CGRectMake(CGFloat(i) * screenWidth, 0, screenWidth, screenHeight), imageName: imageArray[i] as! String)
            self.scrollView?.addSubview(imageView)
            
            //最后一页设置跳转按钮
            if i == imageArray.count - 1 {
                
                self.enterBtn = UIButton(type: .Custom)
                self.enterBtn?.setTitle("进入体验", forState:.Normal)
                self.enterBtn?.setTitleColor(UIColor.redColor(), forState: .Normal)
                self.enterBtn?.setBackgroundImage(UIImage(named: ""), forState: .Normal)
                
                imageView.userInteractionEnabled = true
                imageView.addSubview(self.enterBtn!)
                
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
