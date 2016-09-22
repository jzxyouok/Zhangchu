//
//  ClassfityViewController.swift
//  ZhangChu
//
//  Created by sword on 16/8/13.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit

class ClassfityViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var collectionView : UICollectionView?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        createCollectionView()
    }
    
    func createCollectionView() {
        
        let flowout = UICollectionViewFlowLayout()
        
        flowout.scrollDirection = .Vertical
        
        self.collectionView = UICollectionView(frame: CGRectMake(0, 0, screenWidth, screenHeight - 108), collectionViewLayout: flowout)
        
        self.collectionView?.delegate = self
        
        self.collectionView?.dataSource = self
        
        self.collectionView?.backgroundColor = UIColor.whiteColor()
        
        self.view.addSubview(self.collectionView!)
        
        self.collectionView?.registerClass(ButtonCell.self, forCellWithReuseIdentifier: "btnCell")
        
        self.collectionView?.registerClass(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header")
        
        self.collectionView?.registerClass(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "footer")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

   

}

extension ClassfityViewController {
    
    //flowout
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsetsMake(5, 10, 5, 10)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        return CGSizeMake(screenWidth, 5)
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSizeMake(screenWidth, 20)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSizeMake((screenWidth - 60) / 5, (screenWidth - 60) / 5 * (2 / 3))
    }
    
    //collectionview
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
            
        case 0: return 2
        case 1: return 1
        case 2: return 5
        case 3: return 12
        default: return 7
        }
    }
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 6
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = self.collectionView?.dequeueReusableCellWithReuseIdentifier("btnCell", forIndexPath: indexPath) as! ButtonCell
        
        cell.button.setTitle("小炒", forState: .Normal)
        
        return cell
        
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        let reuseView = UICollectionReusableView()
        
        if kind == UICollectionElementKindSectionHeader {
            
            let headerView = self.collectionView?.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "header", forIndexPath: indexPath)
            headerView?.backgroundColor = UIColor.whiteColor()
            
            let titleLabel = Factory.createLabelWith(CGRectMake(15, 0, (headerView?.frame.size.width)! - 15, (headerView?.frame.size.height)!), text: "小炒", font: UIFont.systemFontOfSize(titleFont), textAlignment: .Left, textColor: UIColor.blackColor())
            headerView?.addSubview(titleLabel)
            
            return headerView!
            
        }
        
        else if kind == UICollectionElementKindSectionFooter {
            
            let  footerView = self.collectionView?.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "footer", forIndexPath: indexPath)
            
            footerView?.backgroundColor = UIColor.lightGrayColor()
            
            return footerView!
        }
        
        return reuseView
        
    }
    
    
    
}
