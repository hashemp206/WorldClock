//
//  GeoLocation.swift
//  WorldClock
//
//  Created by Hashem on 7/20/16.
//  Copyright © 2016 Abounajmi. All rights reserved.
//

import Foundation

class GeoLocation: NSObject {
    let lat: String
    let long: String
    
    required init(lat: String, long: String){
        self.lat = lat
        self.long = long
    }
}
