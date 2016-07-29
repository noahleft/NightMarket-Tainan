//
//  InfoLoader.swift
//  NightMarket
//
//  Created by lin shih-feng on 7/28/16.
//  Copyright © 2016 lin shih-feng. All rights reserved.
//

import Foundation

extension InfoModel {
    
    func loadFromPlist(aFileName: String) {
        var format = NSPropertyListFormat.XMLFormat_v1_0
        let filepath: String? = NSBundle.mainBundle().pathForResource(aFileName, ofType: "plist")
        let plistXML = NSFileManager.defaultManager().contentsAtPath(filepath!)!
        var nightMarketInfos: NSArray = []
        
        do{
            nightMarketInfos = try NSPropertyListSerialization.propertyListWithData(plistXML, options: .MutableContainersAndLeaves, format: &format) as! [AnyObject]
        }
        catch {
            print("Error reading plist: \(error)")
        }
        
        print("definition:")
        print("\(nightMarketInfos.objectAtIndex(0))")
        
        
        let data : NSArray = nightMarketInfos.objectAtIndex(1) as! NSArray
        
        for info in data {
            let aLocationName        = info.objectAtIndex(0) as! String
            let aLatitude            = info.objectAtIndex(1) as! Double
            let aLongitude           = info.objectAtIndex(2) as! Double
            let aLocationDescription = info.objectAtIndex(3) as! String
            let aType                = info.objectAtIndex(4) as! String
            let aOpeningTime         = info.objectAtIndex(5) as! String
            let aSize                = info.objectAtIndex(6) as! Int
            
            let aNMinfo = NightMarketVO(aLocationName: aLocationName, aLatitude: aLatitude, aLongitude: aLongitude, aLocationDescription: aLocationDescription, aType: aType, aOpeningTime: aOpeningTime, aSize: aSize)
            
//            print("\(aNMinfo.description)")
            self.addInfo(aNMinfo)
        }
        
    }
    
}

