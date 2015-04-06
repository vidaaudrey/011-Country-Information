//
//  DataFetchService.swift
//  003-Dribble-Client
//
//  Created by Audrey Li on 3/14/15.
//  Copyright (c) 2015 Shomigo. All rights reserved.
//

import Foundation
import UIKit

class DataFetchService {

    class func getJSONFromFile(filename: String, callback:((NSDictionary) -> Void)) {
        let filePath = NSBundle.mainBundle().pathForResource(filename, ofType: "json")
        var error: NSError?
        let jsonData = NSData(contentsOfFile: filePath!, options: NSDataReadingOptions.DataReadingMappedIfSafe, error: &error)
        if let jsonDictionary: NSDictionary = NSJSONSerialization.JSONObjectWithData(jsonData!, options: NSJSONReadingOptions.MutableContainers, error: &error) as? NSDictionary {
            
            if error != nil {
                println("error in get Json \(error)")
            } else {
                callback(jsonDictionary)
            }
        }
        
    }

    
    class func getJSON(url: String, callback:((NSArray) -> Void)){
        var nsURL = NSURL(string: url)!
        var session = NSURLSession.sharedSession()
        var task = session.dataTaskWithURL(nsURL, completionHandler: { data, response, error -> Void in
            if error != nil {
                println("error !")
            } else {
            let jsonData = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSArray
                callback(jsonData)
            }
        })
        task.resume()
    }
    
    
    class func asyncLoadImage(url: String, imageView: UIImageView, callback:((NSData) -> Void)){
        
        let downloadQueue = dispatch_queue_create("com.shomigo.processsdownload", nil)
        
        dispatch_async(downloadQueue) {
            var data = NSData(contentsOfURL: NSURL(string: url)!)
            var image : UIImage?
            if data != nil {
                image = UIImage(data: data!)!
            }
            
            dispatch_async(dispatch_get_main_queue()) {
                imageView.image = image
            }
        }
        
    }
    
}