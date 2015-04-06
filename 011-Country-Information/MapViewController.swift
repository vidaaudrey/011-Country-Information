//
//  MapViewController.swift
//  CollectionViewTest
//
//  Created by Audrey Li on 4/6/15.
//  Copyright (c) 2015 com.shomigo. All rights reserved.
//

import UIKit

import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate{
    
    @IBOutlet weak var mapView: MKMapView!
    
    //remember to add below to plist NSLocationWhenInUseUsageDescription, NSLocationAlwaysUsageDescription
    var manager = CLLocationManager()
    var data: AnyObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var latitude:CLLocationDegrees?
        var longitude:CLLocationDegrees?
        
        if let d = data as? [CLLocationDegrees] {
            latitude = d[1]
            longitude = d[0]
            println(latitude)
            println(longitude)
        }
        //Core Location
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation() //** act as a timer
        
        

        //define zoom level, 0,01 is standard view. bigger is, more zoom out it is
        var latDelta:CLLocationDegrees = 100
        var lonDelta: CLLocationDegrees = 50
        //use the span to create a region
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        var location:CLLocationCoordinate2D = CLLocationCoordinate2D (latitude: latitude!, longitude: longitude!)
        
        var region: MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        mapView.setRegion(region, animated: true)
        
        // add annotation
        var annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Empire State Building"
        annotation.subtitle = "I am going there someday "
        mapView.addAnnotation(annotation)
        
        // add long press and create annotation
        
        var uiLongPressGestureRec = UILongPressGestureRecognizer(target: self, action: "action:")  // with :, the action will only look for func with peremeter
        uiLongPressGestureRec.minimumPressDuration = 1.0
        mapView.addGestureRecognizer(uiLongPressGestureRec)
        
    }
    
    func action (myUIGestureRecognizer: UIGestureRecognizer) {
        println("test2")
        var touchPoint = myUIGestureRecognizer.locationInView(self.mapView)
        // get the Map coordinates
        var newCoordinates: CLLocationCoordinate2D = mapView.convertPoint(touchPoint, toCoordinateFromView: self.mapView)
        
        var newAnnotation = MKPointAnnotation()
        newAnnotation.coordinate = newCoordinates
        newAnnotation.title = "You pressed Empire State Building"
        newAnnotation.subtitle = "Do you want to go"
        
        mapView.addAnnotation(newAnnotation)
        
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println(error)
    }
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        var location: CLLocation = locations[0] as CLLocation
        
        var latitude:CLLocationDegrees = location.coordinate.latitude
        var longitude:CLLocationDegrees = location.coordinate.longitude
        var latDelta:CLLocationDegrees = 0.1
        var lonDelta: CLLocationDegrees = 0.1
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        var currentLocation:CLLocationCoordinate2D = CLLocationCoordinate2D (latitude: latitude, longitude: longitude)
        var region: MKCoordinateRegion = MKCoordinateRegionMake(currentLocation, span)
        
        mapView.setRegion(region, animated: true)
        
        // add annotation
        var annotation = MKPointAnnotation()
        annotation.coordinate = currentLocation
        annotation.title = "You are here"
        annotation.subtitle = "I am going there someday "
        mapView.addAnnotation(annotation)
        
        println("location: \(location.coordinate.latitude)")
    }
    

    
}