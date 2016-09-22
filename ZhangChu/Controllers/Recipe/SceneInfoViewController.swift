//
//  SceneDetailViewController.swift
//  ZhangChu
//
//  Created by sword on 16/8/29.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit

import MJRefresh

class SceneInfoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var headerImageView = UIImageView()
    
    var numLabel = UILabel()
    
    var descLabel = UILabel()
    
    var tableView = UITableView()
    
    var  model :  Scenes?
    
    var page = 1
    
    var dataArray = NSMutableArray()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        self.navigationItem.title = model?.scene_title!
        
        self.navigationController?.navigationBarHidden = false
        
        self.navigationController?.navigationBar.translucent = true 
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.createUI()

        self.refresh()
        
    }
    
    //MARK:刷新请求数据
    
    func refresh () {
        self.tableView.mj_header = MJRefreshNormalHeader(refreshingBlock: { 
            self.page = 1
            
            self.dataArray.removeAllObjects()
            
            self.getData()
        })
        
        self.tableView.mj_footer = MJRefreshAutoFooter(refreshingBlock: { 
            self.page += 1
            
            self.getData()
        })
        
        self.tableView.mj_header.beginRefreshing()
        
        
    }
    
    func getData() {
        
        let scene_id = self.model?.scene_id
        
        NetWorkingTool.shareNetWorkingTool.loadSceneInfoData(self.page, sceneID: scene_id!) { (sceneInfo) in
            
            self.dataArray.addObjectsFromArray(sceneInfo)
            
            self.tableView.reloadData()
            
        }
        if page == 1 {
            
            self.tableView.mj_header.endRefreshing()
        }
        
        else {
            
            self.tableView.mj_footer.endRefreshing()
        }
        
        
        
        
    }
    
    //MARK UI
    func createUI() {
        
        self.tableView = UITableView(frame: CGRectMake(0, 0, screenWidth, screenHeight), style: .Plain)
        
        self.tableView.delegate = self
        
        self.tableView.dataSource = self
        
        self.tableView.backgroundColor = UIColor.whiteColor()
        
        self.view.addSubview(self.tableView)
        
        self.tableView.registerClass(SceneInfoCell.self, forCellReuseIdentifier: "infoCell")
        
        
        self.headerImageView = Factory.createImageViewWith(CGRectMake(0, 0, screenWidth, screenHeight / 3), imageName: "")
        
        self.headerImageView.sd_setImageWithURL(NSURL(string: model!.scene_background!)!, placeholderImage: UIImage(named: "placeholder.jpg"))
        
        self.tableView.tableHeaderView = self.headerImageView
        
        
        self.numLabel = Factory.createLabelWith(CGRectMake(10, self.headerImageView.frame.size.height * 2 / 3 - 20 , screenWidth - 20, self.headerImageView.frame.size.height / 6), text: "\(model?.dish_count)", font: UIFont.systemFontOfSize(15), textAlignment: NSTextAlignment.Center, textColor: UIColor.whiteColor())
        
        self.headerImageView.addSubview(self.numLabel)
        
        
        self.descLabel = Factory.createLabelWith(CGRectMake(10, self.numLabel.frame.size.height + self.numLabel.frame.origin.y, screenWidth - 20, self.numLabel.frame.size.height), text: "\(model?.scene_desc)", font: UIFont.systemFontOfSize(15), textAlignment: NSTextAlignment.Center, textColor: UIColor.whiteColor())
        
        self.headerImageView.addSubview(self.descLabel)
        
        
        //头视图数据由上一个控制器传值而来
        
        self.headerImageView.sd_setImageWithURL(NSURL(string: (model?.scene_background!)!)!, placeholderImage: UIImage(named: "placeholder.jpg"))
        self.numLabel.text = "\((model?.dish_count)!)道菜"
        
        self.descLabel.text = model?.scene_desc!
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

extension SceneInfoViewController {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count > 0 ? self.dataArray.count : 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("infoCell", forIndexPath: indexPath) as! SceneInfoCell
        if self.dataArray.count > 0  {
            
            let model = self.dataArray[indexPath.row] as! SceneInfo
            
            cell.sceneModel = model
        }
        cell.selectionStyle = .None
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return screenHeight  / 6
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let detailVC = ScenesDetailViewController()
        
        let model  = self.dataArray[indexPath.row] as! SceneInfo
        
        detailVC.sceneModel = model
        
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
}
