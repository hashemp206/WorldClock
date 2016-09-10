//
//  CollectionViewDataSource.swift
//  Dolphin
//
//  Created by Hashem on 7/17/16.
//  Copyright © 2016 foodiran. All rights reserved.
//

import UIKit

class TableViewDataSource: NSObject, UITableViewDataSource {
    
    var items: NSArray!
    let cellIdentifier: String
    let configureBlock: (cell: UITableViewCell, item: AnyObject)->Void

    class func createSampleData()-> Array<City>{
        let tehran = City(name: "تهران", geolocation: GeoLocation(lat: "35.6891975",long: "51.3889736"), timeZone: "Asia/Tehran")
        
        let beijing = City(name: "پکن", geolocation: GeoLocation(lat: "39.904211",long: "116.407395"), timeZone: "Asia/Shanghai")
        
        let rio = City(name: "ریو دی ژانریو", geolocation: GeoLocation(lat: "-22.9068467",long: "-22.9068467"), timeZone: "America/Sao_Paulo")
        
        let sydney = City(name: "سیدنی", geolocation: GeoLocation(lat: "-33.8688197",long: "151.2092955"), timeZone: "Australia/Sydney")
        
        let cupertino = City(name: "کوپرتینو", geolocation: GeoLocation(lat: "37.3229978",long: "-122.0321823"), timeZone: "America/Los_Angeles")
        
        return [tehran, beijing, rio, sydney, cupertino]
    }
    required init(aItems: NSArray, aCellIdentifier: String, aConfigureBlock:(cell: UITableViewCell, item: AnyObject)->Void){
        items = aItems
        cellIdentifier = aCellIdentifier
        configureBlock = aConfigureBlock
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)!
        configureBlock(cell: cell, item: items[indexPath.row])
        return cell
    }
    
}
