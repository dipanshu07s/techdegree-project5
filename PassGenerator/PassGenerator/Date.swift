//
//  Date.swift
//  PassGenerator
//
//  Created by Dipanshu Sehrawat on 22/04/19.
//  Copyright © 2019 Dipanshu Sehrawat. All rights reserved.
//

import Foundation

extension Date {
    static func createDateOfBirthWith(day: Int, month: Int, year: Int) throws -> Date {
        var dateComponent = DateComponents()
        dateComponent.day = day
        dateComponent.month = month
        dateComponent.year = year
        let calander = Calendar.current
        if let date = calander.date(from: dateComponent) {
            return date
        } else {
            throw DateError.dateOfBirthError
        }
    }
    
    static func isBirthday(day: Int, month: Int) -> Bool {
        let date = Date()
        let calender = Calendar.current
        let currentDay = calender.component(.day, from: date)
        let currentMonth = calender.component(.month, from: date)
        
        if currentDay == day && currentMonth == month {
            return true
        }
        
        return false
    }
}
