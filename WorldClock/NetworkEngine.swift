//
//  NetworkEngine.swift
//  WorldClock
//
//  Created by Hashem on 7/20/16.
//  Copyright © 2016 Abounajmi. All rights reserved.
//

import Foundation
import Agent

class NetworkEngine: NSObject {
    
    static func getSunstSunRiseTimeForCity(city: City, completion:(daylight: DayLight?, error: NSError?)->Void) {
        let requestUrl = "http://api.sunrise-sunset.org/json?lat=\(city.geolocation.lat)"+"&lng=\(city.geolocation.long)&formatted=0"
        let req = Agent.get(requestUrl)
        req.end({ (response: NSHTTPURLResponse?, data: AnyObject?, error: NSError?) -> Void in
            // swich to main thread
             dispatch_sync(dispatch_get_main_queue(), {
                if error == nil{
                    let results = data?.valueForKey("results")
                    let sunrise = results?.valueForKey("sunrise") as! String
                    let sunset = results?.valueForKey("sunset") as! String
                    
                    // configure a date formatter with UTC format
                    let dateFormatter = NSDateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
                    let UTCsunriseDate = dateFormatter.dateFromString(sunrise)
                    let UTCsunsetDate = dateFormatter.dateFromString(sunset)
    
                    let daylight = DayLight(sunrise: UTCsunriseDate!, sunset: UTCsunsetDate!)
                    daylight
                    
                    completion(daylight: daylight, error: error)
                }
                else{
                    completion(daylight: nil, error: error)
                }

            })
        })
        
    }
}
