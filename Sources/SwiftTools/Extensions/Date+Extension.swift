//
//  Date+Extension.swift
//  Cinematic
//
//  Created by Richard Witherspoon on 12/12/20.
//  Copyright © 2020 Richard Witherspoon. All rights reserved.
//

import Foundation

public extension Date {
    
    //MARK: Initializers
    init(milliseconds: Double){
        self = Date(timeIntervalSince1970: milliseconds / 1000)
    }
    
    
    //MARK: Computed Properties
    var millisecondsSince1970:Int {
        return Int(self.timeIntervalSince1970 * 1000)
    }
    
    var isToday: Bool {
        Calendar.current.isDateInToday(self)
    }
    
    var startOfDay: Date {
        return Calendar.current.startOfDay(for: self)
    }
    
    var startOfMonth: Date {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month], from: self)
        
        return  calendar.date(from: components)!
    }
    
    var endOfDay: Date {
        var components = DateComponents()
        components.day = 1
        components.second = -1
        return Calendar.current.date(byAdding: components, to: startOfDay)!
    }
        
    static var yesterday: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: Date())!
    }
    
    
    //MARK: Functions
    static func daysAgo(_ value: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: -value, to: Date())!
    }
    
    func isInSame(_ component: Calendar.Component, as date: Date) -> Bool {
        Calendar.current.isDate(self, equalTo: date, toGranularity: component)
    }
}
