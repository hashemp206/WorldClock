//
//  DayLight.swift
//  WorldClock
//
//  Created by Hashem on 7/20/16.
//  Copyright © 2016 Abounajmi. All rights reserved.
//

import Foundation

class DayLight: NSObject {
    let sunrise: NSDate
    let sunset: NSDate
    var dayLength: CGFloat{
        get{
            return CGFloat(sunset.timeIntervalSinceDate(sunrise))
        }
    }
    required init(sunrise: NSDate, sunset: NSDate)
    {
        self.sunrise = sunrise
        self.sunset = sunset
    }
    
}
