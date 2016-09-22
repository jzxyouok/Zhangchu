//
//  StoreViewController.swift
//  ZhangChu
//
//  Created by sword on 16/8/13.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit

class StoreViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var collectionView : UICollectionView?
    
    var separitionLineView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        createUI()
        
    }
    func createUI() {
        
        let flowout = UICollectionViewFlowLayout()
        
        flowout.scrollDirection = .Vertical
        
        self.collectionView = UICollectionView(frame: CGRectMake(0, 0, screenWidth, screenHeight 
            ), collectionViewLayout: flowout)
        self.collectionView?.showsVerticalScrollIndicator  = false
        
        self.collectionView?.showsHorizontalScrollIndicator = false
        
        self.collectionView?.delegate = self
        
        self.collectionView?.dataSource = self
        
        self.collectionView?.backgroundColor = UIColor.whiteColor()
        
        self.view.addSubview(self.collectionView!)
        
        //
        
        self.collectionView?.registerClass(StoreCell.self, forCellWithReuseIdentifier: "storeCell")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

extension StoreViewController {
    
    //flowlayout
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 0, 0, 0)
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake((screenWidth  - 10) / 2, collectionViewHeightOfStore)
    }
    
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
//    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
//        return 10
//    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = self.collectionView?.dequeueReusableCellWithReuseIdentifier("storeCell", forIndexPath: indexPath) as! StoreCell
        cell.backgroundColor = UIColor.whiteColor()
        return cell 
        
    }
    
    //点击跳转
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    
}
