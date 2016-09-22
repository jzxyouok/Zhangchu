//
//  ScenesDetailViewController.swift
//  ZhangChu
//
//  Created by sword on 16/8/30.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit

import MJRefresh

class ScenesDetailViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var sceneModel: SceneInfo?
    
    var tableView = UITableView()
    
    var headerView = UIView()
    
    var headerImageView = UIImageView()
    
    var playButton = UIButton()
    
    var leftBtn = UIButton()
    
    var rightBtn = UIButton()
    
    
    var stepArray = NSMutableArray()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        createUI()
        
        refresh()
        
    }
    
    //MARK 请求数据
    
    func refresh() {
        
        self.tableView.mj_header = MJRefreshNormalHeader(refreshingBlock: { 
            
            self.stepArray.removeAllObjects()
            
            self.getData()
        })
        
        self.tableView.mj_header.beginRefreshing()
        
    }
    
    func getData() {
        
        if let id = sceneModel?.dishes_id {
        NetWorkingTool.shareNetWorkingTool.loadScenesDetailDataWith("\(id)") { (sceneDetail) in
            
            self.stepArray.addObjectsFromArray(sceneDetail.step)
            
            self.tableView.reloadData()
            
        }
        
        self.tableView.mj_header.endRefreshing()
        
        }
                   
    }
    
    //MARK 创建UI
    
    func createUI() {
        
        self.navigationItem.title = sceneModel?.dishes_name
        
        self.tableView = UITableView(frame: CGRectMake(0, 0, screenWidth
            , screenHeight), style:UITableViewStyle.Plain)
        
        self.tableView.delegate = self
        
        self.tableView.dataSource = self
        
        self.tableView.backgroundColor = UIColor.whiteColor()
        
        self.view.addSubview(self.tableView)
        
        self.tableView.registerClass(StepCell.self, forCellReuseIdentifier: "stepCell")
        
        //headerView
        
        self.headerView = UIView(frame: CGRectMake(0, 0, screenWidth, screenHeight  * 0.6 - 10))
        
        self.headerView.backgroundColor = UIColor.whiteColor()
        
        self.tableView.tableHeaderView = self.headerView
        
        //imageView
        self.headerImageView = Factory.createImageViewWith(CGRectMake(0, -20, screenWidth, screenHeight / 3), imageName: "")
        
        self.headerImageView.userInteractionEnabled = true
        
        
        self.headerImageView.sd_setImageWithURL(NSURL(string: (sceneModel?.image!)!)!, placeholderImage: UIImage(named: "placeholder.jpg"))
        
        self.headerView.addSubview(self.headerImageView)
        
        //playButton
        
        self.playButton = UIButton(type: .Custom)
        
        self.playButton.bounds = CGRectMake(0, 0, 44, 44)
        
        self.playButton.center = self.headerImageView.center
        
        self.playButton.setImage(UIImage(named: "play.png"), forState: UIControlState.Normal)
        
        self.playButton.addTarget(self, action: #selector(playVideo(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        
        
        self.headerImageView.addSubview(self.playButton)
        
        //两个小按钮
        
        self.leftBtn = Factory.createButtonWith(CGRectMake(20, self.headerImageView.frame.size.height - 30, 60, 30), type: UIButtonType.Custom, title: "材料准备", titleColor: UIColor.whiteColor(), imageName: "", target: self, action: #selector(playVideo(_:)), backgroundImageName: "")
        
        self.leftBtn.titleLabel?.font = UIFont.systemFontOfSize(14)
        self.leftBtn.backgroundColor = UIColor.clearColor()
        
        self.headerImageView.addSubview(self.leftBtn)
        
        self.rightBtn = Factory.createButtonWith(CGRectMake(120, self.headerImageView.frame.size.height - 30, 60, 30), type: UIButtonType.Custom, title: "详细步骤", titleColor: UIColor.whiteColor(), imageName: "", target: self, action: #selector(playVideo(_:)), backgroundImageName: "")
        
        self.rightBtn.backgroundColor = UIColor.clearColor()
        self.rightBtn.titleLabel?.font = UIFont.systemFontOfSize(14)
        
        self.headerImageView.addSubview(self.rightBtn)
        
        //info
        
        let titleLabel = Factory.createLabelWith(CGRectMake(15, self.headerImageView.frame.size.height - 10, screenWidth - 20, 20), text: "", font: UIFont.systemFontOfSize(15), textAlignment: NSTextAlignment.Left, textColor: UIColor.blackColor())
        titleLabel.text = sceneModel?.dishes_name
        
        self.headerView.addSubview(titleLabel)
        
        var labels = [UILabel]()
        
        if let tags = sceneModel?.tag_info {
            
            for i in 0..<tags.count {
                
                let tag = tags[i] as! TagInfo
                
                let width = labelWidthWithThelengthOfWords(tag.text!)
                let label = Factory.createLabelWith(CGRectMake(15 + CGFloat(i) * 70, titleLabel.frame.size.height + titleLabel.frame.origin.y + 10, width, 15), text: tag.text!, font: UIFont.systemFontOfSize(10), textAlignment: NSTextAlignment.Center, textColor: UIColor.darkGrayColor())
                
                label.layer.borderWidth = 1
                
                label.layer.borderColor = UIColor.orangeColor().CGColor
                
                label.layer.cornerRadius = 2.5
                
                label.layer.masksToBounds = true
                
                self.headerView.addSubview(label)
                
                labels.append(label)
                
            }
        }
        
        let label = labels[0]
       
        //详细介绍标签
        let descLabel = Factory.createLabelWith(CGRectMake(15, label.frame.size.height + label.frame.origin.y + 5, screenWidth - 30, 50), text: "", font: UIFont.systemFontOfSize(13), textAlignment: NSTextAlignment.Left, textColor: UIColor.lightGrayColor())
        
        descLabel.numberOfLines = 0
        
        descLabel.text = sceneModel?.dishes_desc
        
        self.headerView.addSubview(descLabel)
        
        
        //难度 时长 口味 标签
        let strArray = ["难度：一般","时长：40分钟","口味： 鲜"]
        var labelss = [UILabel]()
        for i in 0..<strArray.count {
            
            let label = Factory.createLabelWith(CGRectMake(15 + CGFloat(i) * (screenWidth - 30) / 3, descLabel.frame.origin.y + descLabel.frame.size.height + 5, (screenWidth - 30) / 3, 20), text: "", font: UIFont.systemFontOfSize(13), textAlignment: NSTextAlignment.Center, textColor: UIColor.blackColor())
            
            label.text = strArray[i]
            
            self.headerView.addSubview(label)
            labelss.append(label)
            
        }
        
        
    }
    
    func labelWidthWithThelengthOfWords(text: String) -> CGFloat {
        
        
        return CGFloat(text.characters.count) * 10 + 15
        
    }
    
    //playVideo
    func playVideo(button: UIButton) {

        print("bofang")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    
    }
    


}

extension ScenesDetailViewController {
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.stepArray.count > 0 ? self.stepArray.count : 0
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("stepCell", forIndexPath: indexPath) as! StepCell
        
        if self.stepArray.count > 0 {
            
            let model = stepArray[indexPath.row] as! Step
            
            cell.step = model
            
        }
        
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return screenHeight * 0.3
    }
    
    
}
