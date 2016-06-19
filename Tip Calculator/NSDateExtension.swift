//
//  NSDateExtension.swift
//  Tip Calculator
//
//  Created by Lily on 6/15/16.
//  Copyright © 2016 Lily Tran. All rights reserved.
//

import Foundation

extension NSDate
{
    func minute() -> Int {
        let calendar = NSCalendar.currentCalendar()
        let minute = calendar.component(.Minute, fromDate: self)
        return minute
    }
    
    func getTimeDifference(time: NSDate) -> Int {
        let elapsedTime = NSDate().timeIntervalSinceDate(time)
        let timeValue = Int(elapsedTime)
        let minutes = (timeValue % 3600)/60
        return minutes
    }
}