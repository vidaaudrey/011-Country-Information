//
//  CollectionViewCell.swift
//  012-Word-Color-Lean-View-Controller-With-UITableView-UICollectionView
//
//  Created by Audrey Li on 4/4/15.
//  Copyright (c) 2015 com.shomigo. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
 
    func configureForItem(item:AnyObject) {
     //   label.text = item as? String
        if let country:Country = item as? Country {
            label.text = country.countryName
            imageView.image = UIImage(named: country.countryCode.lowercaseString)
        }
        
    }
    
}
