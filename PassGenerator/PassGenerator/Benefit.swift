//
//  Benefit.swift
//  PassGenerator
//
//  Created by Dipanshu Sehrawat on 21/04/19.
//  Copyright © 2019 Dipanshu Sehrawat. All rights reserved.
//

import Foundation

enum AreaAccess: Equatable {
    case amusement
    case kitchen
    case rideControl
    case maintenance
    case office
}

enum RideAccess: Equatable {
    case allRides
    case skipAllLines
}

enum Discounts: Equatable {
    case food(percentage: Int)
    case merchandise(percentage: Int)
}
