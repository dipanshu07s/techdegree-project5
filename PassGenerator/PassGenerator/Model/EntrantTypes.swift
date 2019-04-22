//
//  Entrant.swift
//  PassGenerator
//
//  Created by Dipanshu Sehrawat on 21/04/19.
//  Copyright © 2019 Dipanshu Sehrawat. All rights reserved.
//

import Foundation

enum PersonType {
    case guest
    case manager
    case employee
    case vendor
}

enum GuestType {
    case classic
    case vip
    case child
    case season
    case senior
}

enum ManagerType {
    case manager
}

enum EmployeeType {
    case foodService
    case rideService
    case maintenance
    case contract(project: Int)
}

enum VendorType {
    case vendor(company: String)
}
