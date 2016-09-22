//
//  CenterTabBarController.swift
//  ZhangChu
//
//  Created by sword on 16/8/13.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit

class CenterTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let recipeVC = RecipeViewController()

        let recipeNav = NavigationController(rootViewController: recipeVC)
        let communityVC = CommunityViewController()
        let communityNav = NavigationController(rootViewController: communityVC)
        let storeVC = StoreViewController()
        let storeNav = NavigationController(rootViewController: storeVC)
        storeNav.titleLabel.text = "商城"
        let studyVC = StudyViewController()
        let studyNav = NavigationController(rootViewController: studyVC)
        studyNav.titleLabel.text = "食课"
        let navArray = [recipeNav, communityNav, storeNav, studyNav]
        self.viewControllers = navArray
        //设置tabbar
        for i in 0..<navArray.count {
            
            let nav = navArray[i]
            
            nav.tabBarItem.title = titleArray[i]
            nav.tabBarItem.image = UIImage(named: tabbarNormalImage[i])?.imageWithRenderingMode(.AlwaysOriginal)
            nav.tabBarItem.selectedImage = UIImage(named: tabbarSelectedImage[i])?.imageWithRenderingMode(.AlwaysOriginal)
            
            
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
