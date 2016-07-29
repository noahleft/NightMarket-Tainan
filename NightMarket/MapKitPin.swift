//
//  MapKitPin.swift
//  NightMarket
//
//  Created by lin shih-feng on 7/28/16.
//  Copyright © 2016 lin shih-feng. All rights reserved.
//

import Foundation
import MapKit

class MapKitPin: NSObject, MKAnnotation {
    
    let title: String?
    let locationName: String
    let coordinate: CLLocationCoordinate2D
    
    init(aTitle:String, aLocationName:String, aCoordinate: CLLocationCoordinate2D) {
        self.title = aTitle
        self.locationName = aLocationName
        self.coordinate = aCoordinate
        
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }
}

extension ViewController: MKMapViewDelegate {
    
    // 1
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? MapKitPin {
            let identifier = "pin"
            var view: MKPinAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier)
                as? MKPinAnnotationView { // 2
                dequeuedView.annotation = annotation
                view = dequeuedView
            } else {
                // 3
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
//                view.rightCalloutAccessoryView = UIButton.buttonWithType(.DetailDisclosure) as UIView
            }
            return view
        }
        return nil
    }
}

