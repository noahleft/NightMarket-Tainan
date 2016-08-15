//
//  NightMarketVO.swift
//  NightMarket
//
//  Created by lin shih-feng on 7/28/16.
//  Copyright © 2016 lin shih-feng. All rights reserved.
//

import Foundation

class NightMarketVO {
    
    var locationName: String?
    var latitude: Double?
    var longitude: Double?
    var locationDescription: String?
    var type: String?
    var openingTime: String?
    var size: Int?
    
    
    init(aLocationName:String,
         aLatitude:Double,
         aLongitude:Double,
         aLocationDescription:String,
         aType:String,
         aOpeningTime:String,
         aSize:Int) {
        self.locationName = aLocationName
        self.latitude = aLatitude
        self.longitude = aLongitude
        self.locationDescription = aLocationDescription
        self.type = aType
        self.openingTime = aOpeningTime
        self.size = aSize
    }
    
    var description:String{
        let _result:String = "NightMarketVO" + " LocationName\(self.locationName)"
                           + ",Latitude\(self.latitude)" + ",Longitude\(self.longitude)"
                           + ",LocationDescription\(self.locationDescription)" + ",Type\(self.type)"
                           + ",OpeningTime\(self.openingTime)" + ",Size\(self.size)"
        return _result
    }
    
    func isOpen() -> Bool {
        let day = NSDate().dayOfWeek()
        let idx: Int = day!-2<0 ?6:day!-2
        let schedule = Array(openingTime!.characters)
        if schedule[idx] == "1" {
            return true
        }
        else {
            return false
        }
    }
    
    
}



extension NSDate {
    func dayOfWeek() -> Int? {
        if
            let cal: NSCalendar = NSCalendar.currentCalendar() ,
            let comp: NSDateComponents = cal.components(.Weekday, fromDate: self) {
            return comp.weekday
        } else {
            return nil
        }
    }
}
