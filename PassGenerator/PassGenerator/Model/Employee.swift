//
//  Employee.swift
//  PassGenerator
//
//  Created by Dipanshu Sehrawat on 21/04/19.
//  Copyright © 2019 Dipanshu Sehrawat. All rights reserved.
//

import Foundation

class Employee: Person {
    
    init(firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: Int) {
        super.init(firstName: firstName, lastName: lastName, dateOfBirth: nil, ssn: nil, project: nil, company: nil, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
    }
}

class FoodServiceEmployee: Employee {
    let employeeType: PassType = .foodService
}

class RideServiceEmployee: Employee {
    let employeeType: PassType = .rideService
}

class MaintenanceEmployee: Employee {
    let employeeType: PassType = .maintenance
}

class ContractEmployee: Employee {
    let employeeType: PassType
    
    init(firstName: String, lastName: String, project: Int, streetAddress: String, city: String, state: String, zipCode: Int) {
        employeeType = .contract(project: project)
        super.init(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
    }
}
