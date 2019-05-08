//
//  RandomData.swift
//  PassGenerator
//
//  Created by Dipanshu Sehrawat on 23/04/19.
//  Copyright © 2019 Dipanshu Sehrawat. All rights reserved.
//

import Foundation

struct RandomData {
    static var firstName: String = "Jon"
    static var lastName: String = "Snow"
    static var dateOfBirth: Date = try! Date.createDateOfBirthWith(day: 1, month: 1, year: 1996)
    static var ssn: Int = 1234
    static var project: Int = 1234
    static var company: String = "King in the north"
    static var streetAddress: String = "Castle"
    static var city: String = "Winterfell"
    static var state: String = "North"
    static var zipCode: Int = 12345
}
