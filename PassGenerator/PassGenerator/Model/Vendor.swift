//
//  Vendor.swift
//  PassGenerator
//
//  Created by Dipanshu Sehrawat on 23/04/19.
//  Copyright © 2019 Dipanshu Sehrawat. All rights reserved.
//

import Foundation

class Vendor: Person {
    var vendorType: PassType
    
    init(firstName: String, lastName: String, dateOfBirth: Date, company: String) {
        vendorType = .vendor(company: company)
        
        super.init(firstName: firstName, lastName: lastName, dateOfBirth: dateOfBirth, ssn: nil, project: nil, company: company, streetAddress: nil, city: nil, state: nil, zipCode: nil)
    }
}
