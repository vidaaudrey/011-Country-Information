//
//  CountryDetailViewController.swift
//  011-Country-Information
//
//  Created by Audrey Li on 4/5/15.
//  Copyright (c) 2015 com.shomigo. All rights reserved.
//

import UIKit

class CountryDetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    var country: Country!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = country.countryName

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
