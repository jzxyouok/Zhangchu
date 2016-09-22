//
//  ItemCell.swift
//  ZhangChu
//
//  Created by sword on 16/8/17.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell,UITableViewDelegate, UITableViewDataSource {

    var tableView = UITableView()
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    func setupUI() {
        
        self.tableView = UITableView(frame: CGRectMake(screenWidth / 2 - 50, 50 - screenWidth / 2, 100, screenWidth))
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.showsVerticalScrollIndicator = false
        
        self.tableView.showsHorizontalScrollIndicator = false
        
        self.tableView.separatorStyle = .None
        
        self.tableView.transform = CGAffineTransformMakeRotation(CGFloat(-M_PI / 2))
        
        self.contentView.addSubview(self.tableView)
        
        self.tableView.registerClass(PictureCell.self, forCellReuseIdentifier: "picCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension ItemCell {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("picCell", forIndexPath: indexPath) as! PictureCell
        cell.transform = CGAffineTransformMakeRotation(CGFloat(M_PI / 2))
        cell.mainImageView.image = UIImage(named: "placeholder.jpg")
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return screenWidth / 4
    }
}
