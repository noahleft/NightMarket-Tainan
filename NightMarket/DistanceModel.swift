//
//  DistanceModel.swift
//  NightMarket
//
//  Created by lin shih-feng on 16/08/2016.
//  Copyright © 2016 lin shih-feng. All rights reserved.
//

import Foundation
import MapKit

extension NightMarketVO {
    
    func getDistance(userLocation: CLLocation) -> CLLocationDistance? {
        if  let lat = self.latitude ,
            let lon = self.longitude,
            let targetLocation: CLLocation = CLLocation(latitude: lat, longitude: lon) {
            return targetLocation.distanceFromLocation(userLocation)
        }
        else {
            return nil
        }
    }
    
    
}

