//
//  RecommendCommunityViewController.swift
//  ZhangChu
//
//  Created by sword on 16/8/14.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit

class RecommendCommunityViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
       createUI()
    }
    
    func createUI() {
       self.tableView = UITableView(frame: CGRectMake(0, 0, screenWidth, screenHeight - 108), style: .Plain)
       self.tableView.delegate = self
       self.tableView.dataSource = self
        self.tableView.separatorStyle = .None
        
    
       self.view.addSubview(self.tableView)
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        self.tableView.registerClass(DaRenCell.self, forCellReuseIdentifier: "darenCell")
        
        self.tableView.registerClass(ItemCell.self, forCellReuseIdentifier: "itemCell")
        
        //headerview
        
        self.tableView.registerClass(MyHeaderCell.self, forCellReuseIdentifier: "myHeaderCell")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension RecommendCommunityViewController {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    //number Of Section
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        switch indexPath.section {
        case 0 :
            
            let cell = self.tableView.dequeueReusableCellWithIdentifier("darenCell", forIndexPath: indexPath) as! DaRenCell
            return cell
            
        case 1...8:
            
            let cell = self.tableView.dequeueReusableCellWithIdentifier("itemCell", forIndexPath: indexPath) as! ItemCell
            
            return cell
            
            
        default :
            let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
            return cell
        }
    }
    
    //sectionheight
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    //MARK:headerView
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerview = self.tableView.dequeueReusableCellWithIdentifier("myHeaderCell") as! MyHeaderCell
        headerview.itemLabel.text = "达人"
        
        return headerview
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    //MARK:FooterView
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let view = UIView(frame: CGRectMake(0, 0, screenWidth, 20))
        view.backgroundColor = UIColor.lightGrayColor()
      
        return  view
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 10
    }
    
    
}

