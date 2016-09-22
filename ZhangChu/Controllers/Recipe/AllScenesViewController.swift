//
//  AllScenesViewController.swift
//  ZhangChu
//
//  Created by sword on 16/8/25.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit

import MJRefresh

import MBProgressHUD
class AllScenesViewController:UIViewController,UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource{

    var collectionView: UICollectionView?
    
    var hud  = MBProgressHUD()
    
    var sceneArray = NSMutableArray()
    
    var page = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
                
      
        createUI()
        
        refresh()
    }
    
    func refresh() {
        
        self.hud.showAnimated(true)
        
       
        
        self.collectionView?.mj_header = MJRefreshNormalHeader(refreshingBlock: { 
            
            self.page = 1
            self.sceneArray.removeAllObjects()
            self.getData()
        })
        
        self.collectionView?.mj_footer = MJRefreshAutoFooter(refreshingBlock: { 
            
            self.page += 1
            
            self.getData()
        })
        
        self.collectionView?.mj_header.beginRefreshing()
        
        
    }
    
    func getData() {
        
        NetWorkingTool.shareNetWorkingTool.loadAllScenesData(self.page) { (scenes) in
           
            self.sceneArray.addObjectsFromArray(scenes)
            self.collectionView?.reloadData()
            
        }
        self.hud.hideAnimated(true)
        
        if page == 1 {
            
            self.collectionView?.mj_header.endRefreshing()
        }
        
        else {
            
            self.collectionView?.mj_footer.endRefreshing()
        }
        
        
        
        
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        self.navigationItem.title = "全部场景"
        self.navigationController?.navigationBarHidden = false
        self.navigationController?.navigationBar.translucent = false
        
       
    }
    
    func createUI() {
        
        self.hud = MBProgressHUD(view: self.view)
        
        self.hud.label.text = "正在努力为你加载..."
        
        self.hud.activityIndicatorColor = UIColor.whiteColor()
        
         (UIActivityIndicatorView.appearanceWhenContainedInInstancesOfClasses([MBProgressHUD.self])).color = UIColor.whiteColor()
        
        self.hud.bezelView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        

        
        let flowout = UICollectionViewFlowLayout()
        flowout.scrollDirection = .Vertical
        
        self.collectionView = UICollectionView(frame: CGRectMake(0, 0, screenWidth, screenHeight), collectionViewLayout: flowout)
        
        self.collectionView?.delegate = self
        
        self.collectionView?.dataSource = self
        
        self.collectionView?.backgroundColor = UIColor.whiteColor()
        
        self.view.addSubview(self.collectionView!)
        
        self.collectionView?.registerClass(ScenesCollectionCell.self, forCellWithReuseIdentifier: "sceneCell")
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    
    }
    
    
}
extension AllScenesViewController {
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(screenWidth / 3, 160)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 0, 0, 0)
    }
    //设置item之间的间距
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
    //设置section之间的间距
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.sceneArray.count > 0 ? self.sceneArray.count : 0 
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = self.collectionView?.dequeueReusableCellWithReuseIdentifier("sceneCell", forIndexPath: indexPath) as! ScenesCollectionCell
        
        if self.sceneArray.count > 0 {
        let model = self.sceneArray[indexPath.item] as! Scenes
        
        cell.model = model
            
        }
//        cell.imageView.image = UIImage(named: "placeholder.jpg")
//        
//        cell.titleLabel.text = "夏至小饮"
//        cell.numLabel.text = "34道菜"
        
        
        
        
        
        return cell
    }
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let sceneDetailVC = SceneInfoViewController()
        
        let model = self.sceneArray[indexPath.row] as! Scenes
        
        sceneDetailVC.model = model
        
        self.navigationController?.pushViewController(sceneDetailVC, animated: true);
    }
}
