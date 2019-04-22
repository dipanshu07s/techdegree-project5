//
//  Vendor.swift
//  PassGenerator
//
//  Created by Dipanshu Sehrawat on 23/04/19.
//  Copyright © 2019 Dipanshu Sehrawat. All rights reserved.
//

import Foundation

extension VendorType {
    func areaAccess() -> [AreaAccess] {
        switch self {
        case .vendor(company: "Acme"): return [.kitchen, .maintenance]
        case .vendor(company: "Orkin"): return [.amusement, .rideControl, .kitchen]
        case .vendor(company: "Fedex"): return [.maintenance, .office]
        case .vendor(company: "NW Eletrical"): return [.amusement, .rideControl, .kitchen, .maintenance, .office]
        default: return []
        }
    }
    
    func rideAccess() -> [RideAccess] {
        return []
    }
    
    func discounts() -> [Discounts] {
        return []
    }
}

class Vendor: Person {
    let personType: PersonType = .vendor
    var vendorType: VendorType
    
    init(firstName: String, lastName: String, dateOfBirth: Date, company: String) {
        vendorType = .vendor(company: company)
        
        super.init(firstName: firstName, lastName: lastName, dateOfBirth: dateOfBirth, ssn: nil, project: nil, company: company, streetAddress: nil, city: nil, state: nil, zipCode: nil)
    }
}
