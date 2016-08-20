//
//  TableViewController.swift
//  NightMarket
//
//  Created by lin shih-feng on 06/08/2016.
//  Copyright © 2016 lin shih-feng. All rights reserved.
//

import Foundation
import UIKit
import MapKit

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let infos = infoModel.getInfoArrays()
        return infos.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "LocationTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! LocationTableViewCell
        
        let infos = infoModel.getInfoArrays()
        let info = infos[(indexPath as NSIndexPath).row]
        
        cell.LocationNameLabel.text = info.locationName
        cell.LocationDescriptionLabel.text = info.locationDescription
        let mdf = MKDistanceFormatter()
        cell.LocationDistance.text = mdf.stringFromDistance(info.getDistance(initialLocation)!)
        
        return cell
    }
    
}
