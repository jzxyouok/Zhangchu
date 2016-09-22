//
//  AppDelegate.swift
//  ZhangChu
//
//  Created by sword on 16/8/12.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit
import MMDrawerController


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var drawerController: MMDrawerController!
    
    var guidePage: GuidePageView?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        let centerTabBarVC = CenterTabBarController()
        let rightVC = MyViewController()
        let rightNav = NavigationController(rootViewController: rightVC)
        rightNav.titleLabel.text = "我的"
        
        self.drawerController = MMDrawerController(centerViewController: centerTabBarVC, rightDrawerViewController: rightNav)
        
        self.drawerController.maximumRightDrawerWidth = screenWidth * 0.8
        self.drawerController.openDrawerGestureModeMask = MMOpenDrawerGestureMode.All
        self.drawerController.closeDrawerGestureModeMask = MMCloseDrawerGestureMode.All
        //动画
        self.drawerController.setDrawerVisualStateBlock { (drawerController, drawerSide, percentVisible) in
            
            var sideDrawerViewController : UIViewController?
            if drawerSide == MMDrawerSide.Right {
                sideDrawerViewController = drawerController.rightDrawerViewController
            }
            sideDrawerViewController?.view.alpha = percentVisible
        }
        
        //设置根视图
        self.window?.rootViewController = self.drawerController
        
        //引导页
        createGuidePage()
        
        // Override point for customization after application launch.
        return true
    }
    func createGuidePage() {
        
        let isFirst = NSUserDefaults.standardUserDefaults().objectForKey("exsit")
        
        if isFirst == nil {
            
            self.guidePage = GuidePageView(frame: (self.window?.frame)!, imageArray: guideImageArray)
            
            self.drawerController.view.addSubview(guidePage!)
            
            NSUserDefaults.standardUserDefaults().setObject("showed", forKey: "exsit")
            
            self.guidePage?.enterBtn?.addTarget(self, action: #selector(self.enterTo), forControlEvents: .TouchUpInside)
            
            
        }
        
        
        
        
        
    }
    
    func enterTo() {
        
        self.guidePage?.removeFromSuperview()
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

