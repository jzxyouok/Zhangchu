//
//  RecipeViewController.swift
//  ZhangChu
//
//  Created by sword on 16/8/13.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController, UIScrollViewDelegate{
    
    var scrollView =  UIScrollView()
    
    var buttonArray = NSMutableArray()
    
    var lineView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.translucent = true
        self.navigationController?.navigationBarHidden = true
        
        createUI()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        for i in 0..<self.buttonArray.count {
            let btn = self.buttonArray[i] as! UIButton
            if btn == self.buttonArray.firstObject as! UIButton {
                
                btn.selected = true
            }
            
        }
    }
    
    func createUI() {
        
        let titleArray = ["推荐","食材","分类"]
        for i in 0..<titleArray.count {
            
            let headBtn = UIButton(type: .Custom)
            headBtn.frame = CGRectMake(screenWidth / 5 * CGFloat(i + 1), 10, screenWidth / 5, 44)
            headBtn.setTitle(titleArray[i], forState: .Normal)
            headBtn.setTitleColor(UIColor.lightGrayColor(), forState: .Normal)
            headBtn.setTitleColor(UIColor.blackColor(), forState: .Selected)
            headBtn.tag = i + 200
            headBtn.addTarget(self, action: #selector(headBtnClicked (_:)), forControlEvents: .TouchUpInside)
            
            self.view.addSubview(headBtn)
            self.buttonArray.addObject(headBtn)
            
            
        }
        //线条指示
        self.lineView = UIView(frame: CGRectMake(screenWidth / 5, 62, screenWidth / 5, 2))
        self.lineView.backgroundColor = UIColor.redColor()
        self.view.addSubview(self.lineView)
        
        //创建scrollView 
        self.scrollView = UIScrollView(frame: CGRectMake(0, 64, screenWidth, screenHeight - 64))
        self.scrollView.delegate = self
        self.scrollView.showsHorizontalScrollIndicator = false
        self.scrollView.pagingEnabled = true
        self.scrollView.bounces = false
        
        self.scrollView.contentSize = CGSizeMake(CGFloat(titleArray.count) * self.scrollView.frame.width, 0)
        
        self.view.addSubview(self.scrollView)
        
        let recommendVC = RecommendViewController()
        
        let foodMaterialVC = FoodMaterialViewController()
        foodMaterialVC.view.backgroundColor = UIColor.lightGrayColor()
        
        let classtifyVC = ClassfityViewController()
        
        let vcArray = [recommendVC, foodMaterialVC, classtifyVC]
        
        for i in 0..<vcArray.count {
            
            let vc = vcArray[i]
            
            vc.view.frame = CGRectMake(CGFloat(i) * screenWidth, 0, screenWidth, screenHeight)
            self.addChildViewController(vc)
            
            self.scrollView.addSubview(vc.view)
            
        }
        
        
        
    }
    func headBtnClicked(sender: UIButton) {
        
        for i in 0..<buttonArray.count {
            
            let  btn = buttonArray[i] as! UIButton
            btn.selected = false
        }
         sender.selected = true
        self.scrollView.contentOffset = CGPointMake(CGFloat(sender.tag -  200) * screenWidth, 0)
        
        UIView.animateWithDuration(0.3) { 
            self.lineView.frame = CGRectMake(screenWidth / 5 * CGFloat(sender.tag - 200 + 1), 61, screenWidth / 5, 3)
        }
        
    }
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        let index = Int(scrollView.contentOffset.x / screenWidth)
        for i in 0..<self.buttonArray.count {
            let btn = self.buttonArray[i] as! UIButton
            btn.selected = false
        }
        let btn = self.buttonArray[index] as! UIButton
        btn.selected = true
        
        UIView.animateWithDuration(0.3) { 
            self.lineView.frame = CGRectMake(screenWidth / 5 * CGFloat(abs(index) + 1), 61, screenWidth / 5, 3)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
