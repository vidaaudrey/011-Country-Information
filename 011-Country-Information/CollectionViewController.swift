//
//  CollectionViewController.swift
//  012-Word-Color-Lean-View-Controller-With-UITableView-UICollectionView
//
//  Created by Audrey Li on 4/4/15.
//  Copyright (c) 2015 com.shomigo. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController {

    var items:[String: [AnyObject]]! // data for the UICollectionView
    var dvcData: AnyObject! //  data for destinationViewController

    var dataSource:MultiSectionCollectionViewDataSource!

    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var objHandler = CountryObjectHandler(jsonFileName: "countries")
        
        items = objHandler.getCountriesDIctionaryWithContinentAnyObject()
        
        self.dataSource = MultiSectionCollectionViewDataSource(items: self.items, cellIdentifier: "coCell", viewController: self, segueIdentifier: "showDetail", configureBlock: { (cell, item) -> () in
            if let actualCell = cell as? CustomCollectionViewCell {
                actualCell.configureForItem(item!)
            }
        })

        collectionView.dataSource = self.dataSource
        collectionView.delegate = self.dataSource
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let dvc = segue.destinationViewController as? DetailTableViewController {
            dvc.data = dvcData
        }
    }

}
