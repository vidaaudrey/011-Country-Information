//
//  CollectionViewController.swift
//  012-Word-Color-Lean-View-Controller-With-UITableView-UICollectionView
//
//  Created by Audrey Li on 4/4/15.
//  Copyright (c) 2015 com.shomigo. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController {

    var items:[String: [AnyObject]]!

    var dataSource:MultiSectionCollectionViewDataSource!

    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        var objHandler = CountryObjectHandler(jsonFileName: "countries")
        
        items = objHandler.getCountriesDIctionaryWithContinentAnyObject()
        
        self.dataSource = MultiSectionCollectionViewDataSource(items: self.items, cellIdentifier: "coCell", configureBlock: { (cell, item) -> () in
            if let actualCell = cell as? CustomCollectionViewCell {
                actualCell.configureForItem(item!)
            }
        })

        collectionView.dataSource = self.dataSource
        
        var array = objHandler.getCountryCodeArray().sorted {$0 < $1}.map{$0.lowercaseString}

        
    }
    

}