//
//  Guest.swift
//  PassGenerator
//
//  Created by Dipanshu Sehrawat on 21/04/19.
//  Copyright © 2019 Dipanshu Sehrawat. All rights reserved.
//

import Foundation



class Guest: Person {
    var seconds = 5
    
    override func swipe(_ pass: AmusementParkPass, on area: AreaAccess) {
        if pass.areaAccess.contains(area) {
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
                guard self.seconds != 0 else {
                    timer.invalidate()
                    self.seconds = 5
                    return
                }
                self.seconds -= 1
            })
            
            if seconds == 5 {
                print("Access Granted")
            } else {
                print("Please wait 5 seconds")
            }
            
        } else {
            print("Access Denied")
        }
    }
}

class ClassicGuest: Guest {
    let guestType: PassType = .classic
    init() {
        super.init(firstName: nil, lastName: nil, dateOfBirth: nil, ssn: nil, project: nil, company: nil, streetAddress: nil, city: nil, state: nil, zipCode: nil)
    }
}

class VIPGuest: Guest {
    let guestType: PassType = .vip
    init() {
        super.init(firstName: nil, lastName: nil, dateOfBirth: nil, ssn: nil, project: nil, company: nil, streetAddress: nil, city: nil, state: nil, zipCode: nil)
    }
}

class ChildGuest: Guest {
    let guestType: PassType = .child
    init(dateOfBirth: Date) {
        super.init(firstName: nil, lastName: nil, dateOfBirth: dateOfBirth, ssn: nil, project: nil, company: nil, streetAddress: nil, city: nil, state: nil, zipCode: nil)
    }
}

class SeniorGuest: Guest {
    let guestType: PassType = .senior
    init(firstName: String, lastName: String, dateOfBirth: Date) {
        super.init(firstName: firstName, lastName: lastName, dateOfBirth: dateOfBirth, ssn: nil, project: nil, company: nil, streetAddress: nil, city: nil, state: nil, zipCode: nil)
    }
}

class SeasonGuest: Guest {
    let guestType: PassType = .season
    init(firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: Int) {
        super.init(firstName: firstName, lastName: lastName, dateOfBirth: nil, ssn: nil, project: nil, company: nil, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
    }
}
