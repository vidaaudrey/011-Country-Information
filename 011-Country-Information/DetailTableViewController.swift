//
//  DetailTableViewController.swift
//  CollectionViewTest
//
//  Created by Audrey Li on 4/6/15.
//  Copyright (c) 2015 com.shomigo. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {

    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var currencyCode: UILabel!
    @IBOutlet weak var population: UILabel!
    @IBOutlet weak var areaInSqkm: UILabel!
    @IBOutlet weak var language: UILabel!
    @IBOutlet weak var capital: UILabel!
    @IBOutlet weak var location: UILabel!
    
    var data: AnyObject!
    var dvcData: AnyObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let country = data as? Country {
            
            flagImageView.image = UIImage(named: country.countryCode.lowercaseString)
            currencyCode.text = "Currency: \(country.currencyCode)"
            population.text = "Population: \(country.population)"
            areaInSqkm.text = "Total Area (SqKm):  \(country.areaInsqKm)"
            language.text = "Language: \(country.language)"
            capital.text = "Capital: \(country.capital)"
            
            let centerLongitude = (country.west + country.east) / 2
            let centerLatitude = (country.north + country.south) / 2
            
            location.text = "Center Point: \(centerLongitude), \(centerLatitude)"
            
            dvcData = [centerLongitude, centerLatitude]
            
        
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let dvc = segue.destinationViewController as? MapViewController {
            dvc.data = dvcData
    //    dvc.data = [38.074024, -122.549474]
        }
    }

    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let headerView = view as UITableViewHeaderFooterView
        headerView.textLabel.textColor = UIColor.grayColor()
        headerView.textLabel.font = UIFont(name: "Helvetica Neue", size: 15)

    }
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row == 0 {
            return self.view.bounds.width * 0.75
        } else {
            return 44
        }
    }

//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Potentially incomplete method implementation.
//        // Return the number of sections.
//        return 3
//    }
//
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete method implementation.
//        // Return the number of rows in the section.
//        return 0
//    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
