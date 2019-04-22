//
//  Person.swift
//  PassGenerator
//
//  Created by Dipanshu Sehrawat on 21/04/19.
//  Copyright © 2019 Dipanshu Sehrawat. All rights reserved.
//

import Foundation

class Person: Entrant {
    var firstName: String?
    var lastName: String?
    var dateOfBirth: Date?
    var ssn: Int?
    var project: Int?
    var company: String?
    var streetAddress: String?
    var city: String?
    var state: String?
    var zipCode: Int?
    
    init(firstName: String?, lastName: String?, dateOfBirth: Date?, ssn: Int?, project: Int?, company: String?, streetAddress: String?, city: String?, state: String?, zipCode: Int?) {
        self.firstName = firstName
        self.lastName = lastName
        self.dateOfBirth = dateOfBirth
        self.ssn = ssn
        self.project = project
        self.company = company
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipCode = zipCode
    }
    
    func swipe(_ pass: AmusementParkPass, on area: AreaAccess) {
        if pass.areaAccess.contains(area) {
            print("Access Granted")
        } else {
            print("Access Denied")
        }
    }
    
    func swipe(_ pass: AmusementParkPass, for area: RideAccess) {
        if pass.rideAccess.contains(area) {
            print("You have this priviledge")
        } else {
            print("Sorry you cannot have this priviledge")
        }
    }
}
