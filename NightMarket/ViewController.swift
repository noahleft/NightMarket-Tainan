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
    
    let plistName : String = "NightMarketInfos"
    
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        infoModel.loadFromPlist(plistName)
        centerMapOnLocation(initialLocation)
        
        let infos = infoModel.getInfoArrays()
        for info in infos {
            addMapKitPin(info.locationName!, aLocationName: info.locationDescription!, aLatitude: info.latitude!, aLongitude: info.longitude!)
        }
        
        mapView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    let initialLocation = CLLocation(latitude: 23.036061, longitude: 120.1932712)
    let regionRadius: CLLocationDistance = 10000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func addMapKitPin(aTitle: String, aLocationName: String, aLatitude: Double, aLongitude: Double) {
        let aCoordinate = CLLocationCoordinate2D(latitude: aLatitude, longitude: aLongitude)
        let mapKitPin = MapKitPin(aTitle: aTitle, aLocationName: aLocationName, aCoordinate: aCoordinate)
        
        mapView.addAnnotation(mapKitPin)
        
    }

}

