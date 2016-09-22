//
//  RootViewController.swift
//  ZhangChu
//
//  Created by sword on 16/8/25.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    var headLabel : UILabel?
    
    var leftButton: UIButton?
    
    var rightButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.navigationController?.navigationBar.barTintColor = UIColor.whiteColor()
        
        self.headLabel = Factory.createLabelWith(CGRectMake(0, 0, 100, 44), text: "", font: UIFont.systemFontOfSize(titleFont + 5), textAlignment: .Center, textColor: UIColor.blackColor())
        
        self.navigationItem.titleView = self.headLabel
        
        self.leftButton = Factory.createButtonWith(CGRectMake(0, 0, 44, 44), type: .Custom, title: "", titleColor: UIColor.whiteColor(), imageName: "", target: self, action: "", backgroundImageName: "")
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: self.leftButton!)
        
        
        self.rightButton = Factory.createButtonWith(CGRectMake(0, 0, 44, 44), type: .Custom, title: "", titleColor: UIColor.whiteColor(), imageName: "", target: self, action: "", backgroundImageName: "")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: self.rightButton!)
      
    }
    func addLeftTarget(selector: Selector) {
       
        self.leftButton?.addTarget(self, action: selector, forControlEvents: .TouchUpInside)
        
    }
    
    func addRightTarget(selector: Selector) {
        
        self.rightButton?.addTarget(self, action: selector, forControlEvents: .TouchUpOutside)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
