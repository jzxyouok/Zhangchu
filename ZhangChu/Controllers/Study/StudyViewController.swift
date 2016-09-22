//
//  StudyViewController.swift
//  ZhangChu
//
//  Created by sword on 16/8/13.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit

class StudyViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        createUI()
    }
    
    func createUI() {
        
        self.tableView = UITableView(frame: CGRectMake(0, 0, screenWidth, screenHeight ), style: .Plain)
        
        self.tableView.delegate = self
        
        self.tableView.dataSource = self
        
        self.tableView.separatorStyle = .None
        
        self.tableView.showsVerticalScrollIndicator = false 
        
        self.tableView.tableFooterView = UIView()
        
        self.view.addSubview(self.tableView)
        
        self.tableView.registerClass(StudyListCell.self, forCellReuseIdentifier: "listCell")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}

extension StudyViewController {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("listCell", forIndexPath: indexPath) as! StudyListCell
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return collectionViewHeight
    }
}
