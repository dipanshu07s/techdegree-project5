//
//  Employee.swift
//  PassGenerator
//
//  Created by Dipanshu Sehrawat on 21/04/19.
//  Copyright © 2019 Dipanshu Sehrawat. All rights reserved.
//

import Foundation

extension EmployeeType {
    func areaAccess() -> [AreaAccess] {
        switch self {
        case .foodService: return [.amusement, .kitchen]
        case .rideService, .contract(project: 1001): return [.amusement, .rideControl]
        case .maintenance: return [.amusement, .kitchen, .rideControl, .maintenance]
        case .contract(project: 1002) : return [.amusement, .rideControl, .maintenance]
        case .contract(project: 1003): return [.amusement, .rideControl, .kitchen, .office]
        case .contract(project: 2001): return [.office]
        case .contract(project: 2002): return [.kitchen, .maintenance]
        default: return []
        }
    }
    
    func rideAccess() -> [RideAccess] {
        switch self {
        case .foodService, .rideService, .maintenance: return [.allRides]
        default: return []
        }
    }
    
    func discounts() -> [Discounts] {
        switch self {
        case .foodService, .rideService, .maintenance: return [.food(percentage: 15), .merchandise(percentage: 25)]
        default: return []
        }
    }
}

class Employee: Person {
    let PersonType: PersonType = .employee
    
    init(firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: Int) {
        super.init(firstName: firstName, lastName: lastName, dateOfBirth: nil, ssn: nil, project: nil, company: nil, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
    }
}

class FoodServiceEmployee: Employee {
    let employeeType: EmployeeType = .foodService
}

class RideServiceEmployee: Employee {
    let employeeType: EmployeeType = .rideService
}

class MaintenanceEmployee: Employee {
    let employeeType: EmployeeType = .maintenance
}

class ContractEmployee: Employee {
    let employeeType: EmployeeType
    
    init(firstName: String, lastName: String, project: Int, streetAddress: String, city: String, state: String, zipCode: Int) {
        employeeType = .contract(project: project)
        super.init(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
    }
}
