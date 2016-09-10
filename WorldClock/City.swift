//
//  City.swift
//  WorldClock
//
//  Created by Hashem on 7/20/16.
//  Copyright © 2016 Abounajmi. All rights reserved.
//

import Foundation

class City: NSObject {
    let name: String
    let geolocation: GeoLocation
    let timeZoneName: String
    // readonly property
    
    var currentTime: NSDate{
        get{
            return NSDate()
        }
    }
    var dayLight: DayLight?
    
    required init(name: String, geolocation: GeoLocation, timeZone: String){
        self.name = name
        self.geolocation = geolocation
        self.timeZoneName = timeZone
    }
}
