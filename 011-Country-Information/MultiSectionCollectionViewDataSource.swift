//
//  MultiSectionCollectionViewDataSource.swift
//  011-Country-Information
//
//  Created by Audrey Li on 4/5/15.
//  Copyright (c) 2015 com.shomigo. All rights reserved.
//


import UIKit



class MultiSectionCollectionViewDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var items: [[AnyObject]]!
    var keys:[String]!
    
    var itemIdentifier:String?
    var configureCellBlock:CollectionViewCellConfigureBlock?
    
    init(items: [String: [AnyObject]], cellIdentifier: String, configureBlock: CollectionViewCellConfigureBlock) {
 
        self.itemIdentifier = cellIdentifier
        self.configureCellBlock = configureBlock
     //   super.init()
        for (K,V) in items {
            if keys == nil {
                self.items = [V]
                self.keys = [K]
            } else {
                self.keys.append(K)
                self.items.append(V)
            }
        }
        
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
       return keys.count
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items[section].count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(self.itemIdentifier!, forIndexPath: indexPath) as UICollectionViewCell
        let item: AnyObject = self.itemAtIndexPath(indexPath)
        
        if (self.configureCellBlock != nil) {
            self.configureCellBlock!(cell: cell, item: item)
        }
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionElementKindSectionHeader:
            
            let headerView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "headerCell", forIndexPath: indexPath) as HeaderCollectionReusableView
            headerView.titleLabel.text = keys[indexPath.section]
            return headerView
            
        default:
            assert(false, "Unexpected element kind")
        }
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func itemAtIndexPath(indexPath: NSIndexPath) -> AnyObject {
        return self.items[indexPath.section][indexPath.row]
    }
    
}
