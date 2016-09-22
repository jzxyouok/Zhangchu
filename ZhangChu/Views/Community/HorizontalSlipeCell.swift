//
//  HorizontalSlipeCell.swift
//  ZhangChu
//
//  Created by sword on 16/8/15.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit

class HorizontalSlipeCell: UITableViewCell, UITableViewDelegate, UITableViewDataSource {
    var tableView = UITableView()
    
    var imageArray = NSMutableArray()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        //从网络请求数据，url
        //self.imageArray = ["","","",""]
    }
    func setupUI() {
        
        //实现tableview 旋转90°
        self.tableView = UITableView(frame: CGRectMake(screenWidth / 2 - self.frame.height , self.frame.height - screenWidth / 2  + 5 , self.frame.height * 2, screenWidth), style: .Plain)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .None
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.showsHorizontalScrollIndicator = false
        self.tableView.transform = CGAffineTransformMakeRotation(CGFloat( -M_PI / 2))
        //print(self.tableView.frame)
        self.addSubview(self.tableView)
        
        self.tableView.registerNib(UINib(nibName: "HoriSlipeCell",bundle: nil), forCellReuseIdentifier: "horiSlipeCell")
        
        
    }
    
    
  

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension HorizontalSlipeCell {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.imageArray.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("horiSlipeCell", forIndexPath: indexPath) as! HoriSlipeCell
        cell.transform = CGAffineTransformMakeRotation(CGFloat(M_PI / 2))
        let model = self.imageArray[indexPath.row] as! String
        
        cell.topicImage.sd_setImageWithURL(NSURL(string: imageArray[indexPath.row] as! String), placeholderImage: UIImage(named: "placeholder.jpg"))
        //cell.topicImage.image = UIImage(named: model)
        
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return self.frame.width / 2 
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
}
