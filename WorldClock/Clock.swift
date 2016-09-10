//
//  Clock.swift
//  WorldClock
//
//  Created by Hashem on 7/20/16.
//  Copyright © 2016 Abounajmi. All rights reserved.
//


import UIKit
import PMKVObserver

class Clock: UIView {
    
    private var timer: NSTimer?
    var city: City!{
        
        didSet{
            // to immediately change the clock else 1 second later clock will gets layout

            self.setNeedsDisplay()
            startClcok()
        }
    }
    
    override func drawRect(rect: CGRect) {
        
        let currentDate = city.currentTime // You can input the custom as well
        let calendar = NSCalendar.currentCalendar()
        var currentDateComponents = calendar.components([.Hour, .Minute, .Second], fromDate:  currentDate)
        
        // current time is in UTC format
        var dayLightProgress: CGFloat = 0.0
        if city.dayLight != nil {
            let sunriseComponents = calendar.components([.Hour, .Minute, .Second], fromDate:  city.dayLight!.sunrise)
            // create date based on dateComponnets and get elasped time of day and finally calculate daylightProgress
            dayLightProgress = CGFloat(calendar.dateFromComponents(currentDateComponents)!.timeIntervalSinceDate(calendar.dateFromComponents(sunriseComponents)!))/city.dayLight!.dayLength
            
            // if daylight progress is negative it means its midnight
            dayLightProgress = dayLightProgress < 0 ? 1 :dayLightProgress
        }
        
        // then we apply time zone on the calendar the display local time
        calendar.timeZone = NSTimeZone(name: city.timeZoneName)!
        currentDateComponents = calendar.components([.Hour, .Minute, .Second], fromDate:  currentDate)
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()
        
        //// Symbol Drawing
        let width = fmin(rect.width, rect.height)
        let widthDif = rect.width - width

        let symbolRect = CGRectMake(widthDif/2.0, frame.minY, width, width)
        CGContextSaveGState(context)
        UIRectClip(symbolRect)
        CGContextTranslateCTM(context, symbolRect.origin.x, symbolRect.origin.y)
        CGContextScaleCTM(context, symbolRect.size.width / 260, symbolRect.size.height / 260)
        
        
        ClockStyleKit.drawClock(hours: CGFloat(currentDateComponents.hour), minutes: CGFloat(currentDateComponents.minute), seconds: CGFloat(currentDateComponents.second), daylightProgress: dayLightProgress)
        CGContextRestoreGState(context)

        
        
    }
    
    func startClcok(){
        // fire a time on every 1 second
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(tick), userInfo: nil, repeats: true)
    }
    
    
    func tick() {
        self.setNeedsDisplay()
    }
}
