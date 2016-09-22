//
//  NewestShareViewController.swift
//  ZhangChu
//
//  Created by sword on 16/8/14.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit

class NewestShareViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var collectionView : UICollectionView?
    
    var dataArray = NSMutableArray()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        createCollectionView()
    }
    
    func createCollectionView() {
        
        let flowout = UICollectionViewFlowLayout()
        
       // flowout.itemSize = CGSizeMake(screenWidth / 2, collectionViewHeight)
        flowout.scrollDirection = .Vertical
        
        
        self.collectionView = UICollectionView(frame: CGRectMake(0, 0, screenWidth, screenHeight - 108), collectionViewLayout: flowout)
        
        self.collectionView?.delegate = self
        
        self.collectionView?.dataSource = self
        
        self.collectionView?.backgroundColor = UIColor.whiteColor()
        
        self.collectionView?.registerClass(ShareCell.self, forCellWithReuseIdentifier: "shareCell")
        
        self.view.addSubview(self.collectionView!)
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

}

extension NewestShareViewController {
    
   //layout
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSizeMake(screenWidth, 10)
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 5
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        
        
        return UIEdgeInsetsMake(0, 0, 0, 0)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake((screenWidth - 10 ) / 2, collectionViewHeight)
    }
    
    //collectionview
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 10
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = self.collectionView?.dequeueReusableCellWithReuseIdentifier("shareCell", forIndexPath: indexPath) as! ShareCell
        
        
        return cell
        
    }
    
    
    
    
    
  
}
