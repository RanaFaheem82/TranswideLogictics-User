//
//  Date+Extension.swift
//  WrestlerBlower
//
//  Created by Gulfam Khan on 17/10/2019.
//  Copyright © 2019 Rapidzz. All rights reserved.
//

import Foundation


extension Date {
    
    func dayNumberOfWeek() -> Int? {
        return Calendar.current.dateComponents([.weekday], from: self).weekday
    }
    
    func currentDateString() -> String {
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.dateFormat = "dd-MM-yyyy"
        return formatter.string(from: self)
    }
    
    func currentTimeString() -> String {
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.dateFormat = "hh:mm:ss a"
        return formatter.string(from: self)
    }
}
