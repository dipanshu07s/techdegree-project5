//
//  Manager.swift
//  PassGenerator
//
//  Created by Dipanshu Sehrawat on 21/04/19.
//  Copyright © 2019 Dipanshu Sehrawat. All rights reserved.
//

import Foundation

extension ManagerType {
    func areaAccess() -> [AreaAccess] {
        return [.amusement, .kitchen, .rideControl, .maintenance, .office]
    }
    
    func rideAccess() -> [RideAccess] {
        return [.allRides]
    }
    
    func discounts() -> [Discounts] {
        return [.food(percentage: 25), .merchandise(percentage: 25)]
    }
}

class Manager: Person {
    let personType: PersonType = .manager
    let managerType: ManagerType = .manager
    
    init(firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: Int) {
        super.init(firstName: firstName, lastName: lastName, dateOfBirth: nil, ssn: nil, project: nil, company: nil, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
    }
}
