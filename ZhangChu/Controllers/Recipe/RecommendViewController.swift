//
//  RecommendViewController.swift
//  ZhangChu
//
//  Created by sword on 16/8/13.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit

import MJRefresh



class RecommendViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableView = UITableView()
    
    var cyclePlaying =  Carousel()
    
    var dataArray = NSMutableArray()
    
    var adCourses = [AdCourse]()
    var cellInfos =  [Widget]()
    
    var imageArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        createUI()
        
        
        getData()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        self.navigationController?.navigationBarHidden = true
        self.navigationController?.navigationBar.translucent = true 
    }
    
    
    
    func getData() {
        
        NetWorkingTool.shareNetWorkingTool.loadHomeData { [weak self](adCourse, widget) in
            self!.adCourses = adCourse
            self!.cellInfos = widget
            
            self!.tableView.reloadData()
            
            
            
        }
        
        
        
        
    }
    
    
    func createUI() {
        self.tableView = UITableView(frame: CGRectMake(0, 0, screenWidth, screenHeight - 108), style: .Plain)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        
        self.tableView.tableFooterView = UIView()
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        self.view.addSubview(self.tableView)
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        //
        self.tableView.registerNib(UINib(nibName: "FourButtonContainerCell",bundle: nil), forCellReuseIdentifier: "btncell")
        //
        self.tableView.registerClass(HorizontalSlipeCell.self, forCellReuseIdentifier: "slipeCell")
        //todayCell
        self.tableView.registerNib(UINib(nibName: "newTodayCell", bundle: nil), forCellReuseIdentifier: "todayCell")
        
        //
        self.tableView.registerClass(LastFootCell.self, forCellReuseIdentifier: "lastFootCell")
        
        //sectionHeaderView
        self.tableView.registerClass(SectionFootCell.self, forCellReuseIdentifier: "sectionFootCell")
        
        //headerview
        self.tableView.registerClass(HeaderCell.self, forCellReuseIdentifier: "headerCell")
        
        // tableFooterView
        
        self.tableView.tableHeaderView = UIView(frame: CGRectMake(0, 0, screenWidth, 10))
        
        
        self.tableView.tableFooterView = UIView()
        
        //场景 
        self.tableView.registerClass(SceneCell.self, forCellReuseIdentifier: "sceneCell")
        
        
        
        //广告轮播
        self.cyclePlaying = Carousel(frame: CGRectMake(0, 0,screenWidth, screenHeight / 6 ))
        
        self.cyclePlaying.needPageControl = true
        //应该网络获取数据，不断更新
        self.cyclePlaying.imageUrlArray = ["http://img.szzhangchu.com/1471592136402_5661166482.jpg","http://img.szzhangchu.com/1471592696039_4256538303.jpg","http://img.szzhangchu.com/1471591802008_2536382907.jpg","http://img.szzhangchu.com/1471593337802_5439011876.jpg","http://img.szzhangchu.com/1471593737561_9581963593.jpg"]
        
        self.cyclePlaying.infiniteLoop = true
        
        self.cyclePlaying.pageControlPositionType = PAGE_CONTROL_POSITION_TYPE_RIGHT
        
        self.tableView.tableHeaderView = self.cyclePlaying
        /*
        for i in 0..<self.adCourses.count {
            let model = self.adCourses[i]
            let imageurl = model.banner_picture
            print(imageurl!)
            self.imageArray.addObject(imageurl!)
        }
        
        self.cyclePlaying.imageUrlArray = self.imageArray as [AnyObject]
       */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

extension RecommendViewController {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
        
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.cellInfos.count > 0 ? self.cellInfos.count - 4: 0
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        switch indexPath.section {
            
        case 0 :
            
            let cell = self.tableView.dequeueReusableCellWithIdentifier("btncell", forIndexPath: indexPath)
            cell.selectionStyle = .None
            
            return cell
            
        case 1 :
            
            let cell = self.tableView.dequeueReusableCellWithIdentifier("slipeCell", forIndexPath: indexPath) as! HorizontalSlipeCell
            let model = self.cellInfos[1] as! Widget
            
            var imageUrls = NSMutableArray()
            let arrays = model.widget_data
            for item in arrays {
               
                let url = item.content
                
                imageUrls.addObject(url!)
            }
            
            cell.imageArray = imageUrls

            cell.selectionStyle = .None
            
            return cell
            
        case 2 :
            
            let cell = self.tableView.dequeueReusableCellWithIdentifier("todayCell", forIndexPath: indexPath) as! newTodayCell
            
            let model = cellInfos[2].widget_data
            var todayArray = NSMutableArray()
            var dict = NSDictionary()
            for i in 0...2 {
              let url = model[i * 4].content
              let mp4Url = model[i * 4 + 1].content
              let title = model[i * 4 + 2].content
              let desc = model[i * 4 + 3].content
              let dict = NSDictionary(objects: [url!, mp4Url!, title!, desc!], forKeys: ["url","mp4Url","title", "desc"], count: 4)
                
               todayArray.addObject(dict)
               cell.imageViews[i].setImageWithURL(NSURL(string: url!)!)
               cell.titleLabels[i].text = title!
               cell.detailLabels[i].text = desc!
              
            }
            cell.selectionStyle = .None
            
            return cell
            
        case 3...5 :
            
            
            let cell = self.tableView.dequeueReusableCellWithIdentifier("sceneCell", forIndexPath: indexPath) as! SceneCell
            
            if let detailInfo = cellInfos[indexPath.section].desc {
                cell.footLabel.text = detailInfo
                
            }
            
            let model = cellInfos[indexPath.section].widget_data
            cell.mainImageView.setImageWithURL(NSURL(string: model[0].content!)!, placeholderImage: UIImage(named: "placeholder.jpg"))
            for i in 0..<cell.imageArray.count {
              
                cell.imageViews[i].setImageWithURL(NSURL(string: model[i * 2 + 3].content!)!, placeholderImage: UIImage(named: "placeholder.jpg"))
            }
            cell.selectionStyle = .None
            
            return cell
        default :
            let cell = UITableViewCell()
            return cell
            
        }
    
    }
    
    //header
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section >= 2 && section <= 5 {
        let headerCell = self.tableView.dequeueReusableCellWithIdentifier("headerCell")
        as! HeaderCell
        // let titleArray = ["今日新品 >","午餐精神 >","健康100岁 >","达人私房菜 >"]
          headerCell.label.text = "\(cellInfos[section].title! + "  >")"
            
            return headerCell
    
        }
        else  {
            let cell = self.tableView.dequeueReusableCellWithIdentifier("cell")
            return cell
        }
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section >= 2 && section <= 5 {
            return 40
        }
        else {
            return 0
        }
    }
    
    //footer
    
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        switch section {
            
        case 5 :
            let lastFootCell = self.tableView.dequeueReusableCellWithIdentifier("lastFootCell") as! LastFootCell
            
            lastFootCell.backgroundColor = UIColor.lightGrayColor()
           lastFootCell.allSceneButton.addTarget(self, action: #selector(movetoAll), forControlEvents:.TouchUpInside)
            
            return lastFootCell
        default :
            
            let footCell = self.tableView.dequeueReusableHeaderFooterViewWithIdentifier("sectionFootCell")
            
            
            return footCell
        }
        
    
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 5 {
            return 40
        }
        else {
            
            return 10
        }
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        switch indexPath.section {
            
        case 0 : return 60
        case 1 : return 100
        case 2 : return 160
        case 3...5 : return 190
        default : return 0
        }
        
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.section == 0 {
            
        }
        
    }
    
    func movetoAll() {
        let allScenesVC = AllScenesViewController()
        
        self.navigationController?.pushViewController(allScenesVC, animated: true)
    }
    
    func playVideo(button: UIButton) {
        
        print("播放video")
    }
    
    
    
}
