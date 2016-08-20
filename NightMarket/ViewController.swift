//
//  ViewController.swift
//  NightMarket
//
//  Created by lin shih-feng on 7/28/16.
//  Copyright © 2016 lin shih-feng. All rights reserved.
//

import UIKit
import MapKit


class ViewController: UIViewController {

    var infoModel : InfoModel = InfoModel()
    let locationManager = CLLocationManager()
    let plistName : String = "NightMarketInfos"
    
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var mapListSegment: UISegmentedControl!
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var dateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        infoModel.loadFromPlist(plistName)
        centerMapOnLocation(initialLocation)
        mapView.showsUserLocation = true
        AskCurrentLocation()
        
        let infos = infoModel.getInfoArrays()
        print("# of night markets open today:" + "\(infos.count)")
        for info in infos {
            addMapKitPin(info.locationName!, aLocationName: info.locationDescription!, aLatitude: info.latitude!, aLongitude: info.longitude!, aDistance: info.getDistance(initialLocation)!)
        }
        
        mapView.delegate = self
        
        let currentDate = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateStyle = NSDateFormatterStyle.MediumStyle
        let date = formatter.stringFromDate(currentDate)
        dateButton.setTitle(date, forState: UIControlState())
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    var initialLocation = CLLocation(latitude: 22.9922521, longitude: 120.1829396)
    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func addMapKitPin(aTitle: String, aLocationName: String, aLatitude: Double, aLongitude: Double, aDistance: CLLocationDistance) {
        let aCoordinate = CLLocationCoordinate2D(latitude: aLatitude, longitude: aLongitude)
        let mapKitPin = MapKitPin(aTitle: aTitle, aLocationName: aLocationName, aCoordinate: aCoordinate)
        
        mapView.addAnnotation(mapKitPin)
        print("\(aTitle)   \(aDistance)")
    }

    @IBAction func touchTopBar(sender: AnyObject) {
        print("Ask Current Location")
        AskCurrentLocation()
    }
    
    @IBAction func toggleSegmentControl(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            mapView.hidden = false
            tableView.hidden = true
        }
        else {
            mapView.hidden = true
            tableView.hidden = false
        }
    }
    

}

