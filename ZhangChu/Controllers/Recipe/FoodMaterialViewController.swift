//
//  FoodMaterialViewController.swift
//  ZhangChu
//
//  Created by sword on 16/8/13.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit

class FoodMaterialViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var materialArray = [Material]()
    
    var collectionView : UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        createUI()
        
        getData()
    }
    //MARK 请求数据
    func getData() {
        
        
        NetWorkingTool.shareNetWorkingTool.loadMaterialData { (materials) in
            
            self.materialArray.appendContentsOf(materials)
            //print(self.materialArray[1])
            self.collectionView?.reloadData()
        }
        
        
    }
    
    //MARK UI
    func createUI() {
        let flowout = UICollectionViewFlowLayout()
        
        flowout.scrollDirection = .Vertical
        
        self.collectionView = UICollectionView(frame: CGRectMake(0, 0, screenWidth, screenHeight - 108), collectionViewLayout: flowout)
        
        self.collectionView?.backgroundColor = UIColor.whiteColor()
        self.collectionView?.showsVerticalScrollIndicator = false
        
        self.collectionView?.showsHorizontalScrollIndicator = false
        
        self.collectionView?.delegate = self
        
        self.collectionView?.dataSource = self
        
        self.view.addSubview(self.collectionView!)
        
        self.collectionView?.registerClass(ButtonCell.self, forCellWithReuseIdentifier: "btnCell")
        /*
 
        //header
        
        self.collectionView?.registerClass(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: "HeaderReuseView", withReuseIdentifier: "header")
        
        //footer
        
        self.collectionView?.registerClass(FooterCollectionReusableView.self, forSupplementaryViewOfKind: "FooterReuseView", withReuseIdentifier: "footer")
        
        */
        //header
        self.collectionView?.registerClass(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header")
        
        //footer
        
        self.collectionView?.registerClass(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "footer")
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}

extension FoodMaterialViewController {
    
    //headerfooter
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSizeMake(screenWidth, 20)
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        return CGSizeMake(screenWidth, 5)
    }
    
   func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
//        if kind == "HeaderReuseView" {
//                let reuseView = self.collectionView?.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "header", forIndexPath: indexPath)
//            
//        }
        let reuseView = UICollectionReusableView()
    
        if kind == UICollectionElementKindSectionHeader {
            
            let headerView = self.collectionView?.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "header", forIndexPath: indexPath)
            
            headerView?.backgroundColor = UIColor.whiteColor()
            
          //var titleLabel = UILabel()
            
            if headerView?.viewWithTag(indexPath.section + 10)  == nil {
                
            
            let  titleLabel = Factory.createLabelWith(CGRectMake(15, 0, ((headerView?.frame.size.width)! - 15), (headerView?.frame.size.height)!), text: "", font: UIFont.systemFontOfSize(titleFont), textAlignment: .Left, textColor: UIColor.orangeColor())
            titleLabel.tag = indexPath.section + 100
            headerView?.addSubview(titleLabel)
            
            titleLabel.text = self.materialArray[indexPath.section].text
                
            }
            
            return headerView!
            
        }
        else if kind == UICollectionElementKindSectionFooter {
            
            let footerView = self.collectionView?.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "footer", forIndexPath: indexPath)
            
            footerView?.backgroundColor = UIColor.lightGrayColor()
            
            
            return footerView!
            
    }
       return reuseView
    
    }
    
    
    //flowlayout
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        
       /* return UIEdgeInsetsMake(<#T##top: CGFloat##CGFloat#>, <#T##left: CGFloat##CGFloat#>, <#T##bottom: CGFloat##CGFloat#>, <#T##right: CGFloat##CGFloat#>)
        */
        return UIEdgeInsetsMake(5, 10, 5, 10)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake((screenWidth - 60) / 5, (screenWidth - 60) / 5 * ( 2 / 3))
    }
    
    //collectionview
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = self.collectionView?.dequeueReusableCellWithReuseIdentifier("btnCell", forIndexPath: indexPath) as! ButtonCell
        
        if self.materialArray.count > 0 {
            
            let subMaterial = self.materialArray[indexPath.section].data
            
            let model = subMaterial[indexPath.item]
            
            cell.model = model
            
        }
        
        return cell
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.materialArray.count > 0 {
        
            return materialArray[section].data.count
        }
        else {
            
            return 0
        }
    
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return self.materialArray.count > 0 ? self.materialArray.count : 0
    }
    
   

}
