//
//  DaRenCell.swift
//  ZhangChu
//
//  Created by sword on 16/8/17.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit

class DaRenCell: UITableViewCell, UITableViewDelegate, UITableViewDataSource {
    
    var tableView = UITableView()

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    func setupUI() {
        self.tableView = UITableView(frame: CGRectMake(screenWidth / 2 - 50,  50 - screenWidth / 2 , 100,screenWidth), style: .Plain)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.showsVerticalScrollIndicator = false
        
        self.tableView.transform = CGAffineTransformMakeRotation(CGFloat(-M_PI / 2))
        self.tableView.separatorStyle = .None
        
        
        
        self.contentView.addSubview(tableView)
        
        self.tableView.registerClass(DarenIconCell.self, forCellReuseIdentifier: "iconCell")
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension DaRenCell {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 8
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("iconCell", forIndexPath: indexPath) as! DarenIconCell
        cell.transform = CGAffineTransformMakeRotation( CGFloat(M_PI / 2))
        cell.nameLabel.text  = "帅哥"
        
        cell.iconImageView.image = UIImage(named: "placeholder.jpg")
        
        cell.fansLabel.text = "粉丝：2000 "
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return screenWidth / 4
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
}
