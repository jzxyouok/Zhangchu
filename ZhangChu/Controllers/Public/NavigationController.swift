//
//  NavigationController.swift
//  ZhangChu
//
//  Created by myappleair on 16/8/13.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit
import SVProgressHUD

class NavigationController: UINavigationController

{
    var titleLabel = UILabel()

    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //设置导航栏标题
        let navBar = UINavigationBar.appearance()
        navBar.barTintColor = UIColor.whiteColor()
        navBar.tintColor = UIColor.lightGrayColor()
        navBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.blackColor(), NSFontAttributeName: UIFont.systemFontOfSize(15)]
        
        self.titleLabel = UILabel(frame: CGRectMake(screenWidth / 2 - 30, 10, 60, 44))
        self.titleLabel.textAlignment = .Center
        self.titleLabel.tintColor = UIColor.lightGrayColor()
        self.view.addSubview(self.titleLabel)
        self.navigationItem.titleView = self.titleLabel
       // self.view.addSubview(self.titleLabel)
    }
    /**
     # 统一所有控制器导航栏左上角的返回按钮
     # 让所有push进来的控制器，它的导航栏左上角的内容都一样
     # 能拦截所有的push操作
     - parameter viewController: 需要压栈的控制器
     - parameter animated:       是否动画
     */
    override func pushViewController(viewController: UIViewController, animated: Bool)
    {
        /// 这时push进来的控制器viewController，不是第一个子控制器（不是根控制器）
        if viewControllers.count > 0
        {
            // push 后隐藏 tabbar
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back.png"), style: .Plain, target: self, action: #selector(navigationBackClick))
            //self.navigationBarHidden = false
            //self.navigationBar.translucent = false
        }
        super.pushViewController(viewController, animated: true)
    }
    /// 返回按钮
    func navigationBackClick()
    {
        if SVProgressHUD.isVisible()
        {
            SVProgressHUD.dismiss()
        }
        if UIApplication.sharedApplication().networkActivityIndicatorVisible
        {
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        }
        popViewControllerAnimated(true)
    }


    override func didReceiveMemoryWarning()
    {
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
